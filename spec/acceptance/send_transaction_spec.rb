require 'spec_helper'

RSpec.describe "#send_transaction", vcr: {record: :all} do

  it "signs a transaction" do
    client = BitGoClient.new(CONFIG.slice(:host, :access_token))

    build_response = client.build_transaction(
      coin: "tbtc",
      wallet_id: CONFIG[:tbtc_wallet_id],
      recipients: [
        address: CONFIG[:tbtc_recipient],
        amount: 5_000,
      ],
    )

    binding.pry if !build_response.success?
    expect(build_response).to be_success

    sign_response = client.sign_transaction(
      coin: "tbtc",
      wallet_id: CONFIG[:tbtc_wallet_id],
      tx_prebuild: build_response.body,
      keychain: JSON.parse(CONFIG[:tbtc_encrypted_keychain]),
      wallet_passphrase: CONFIG[:tbtc_wallet_passphrase],
    )

    expect(sign_response).to be_success

    # unlock_response = client.unlock(
    #   otp: "000000",
    #   duration: 10,
    # )
    # expect(unlock_response).to be_success

    response = client.send_transaction(
      coin: "tbtc",
      wallet_id: CONFIG[:tbtc_wallet_id],
      tx_hex: sign_response.body["txHex"],
      otp: "000000",
    )

    expect(response).to be_success
    binding.pry
    expect(response.body["txid"]).to be_present
    expect(response.body["txHex"]).to be_present
    expect(response.body["status"]).to eq "signed"
  end

end
