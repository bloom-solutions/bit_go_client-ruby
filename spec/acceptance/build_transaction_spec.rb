require 'spec_helper'

RSpec.describe "#build_transaction", vcr: {record: :once} do

  it "builds a transaction" do
    client = BitGoClient.new(CONFIG.slice(:host, :access_token))

    response = client.build_transaction(
      coin: "tbtc",
      wallet_id: CONFIG[:tbtc_wallet_id],
      recipients: [
        address: CONFIG[:tbtc_recipient],
        amount: 1_000_000,
      ],
    )

    expect(response).to be_success
    expect(response.body["txHex"]).to be_present
    expect(response.body["feeInfo"]["fee"]).to be_an Integer
  end

end
