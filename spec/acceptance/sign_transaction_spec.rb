require 'spec_helper'

RSpec.describe "#sign_transaction", vcr: {record: :once} do

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

    expect(build_response).to be_success

    response = client.sign_transaction(
      coin: "tbtc",
      wallet_id: CONFIG[:tbtc_wallet_id],
      tx_prebuild: build_response.body,
      keychain: JSON.parse(CONFIG[:tbtc_encrypted_keychain]),
      wallet_passphrase: CONFIG[:tbtc_wallet_passphrase],
    )

    expect(response).to be_success
    expect(response.body["txHex"]).to be_present
  end

end
