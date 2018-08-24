module BitGoClient
  class SendTransactionRequest < BaseRequest

    attribute :coin, String
    attribute :wallet_id, String
    attribute :tx_hex, String
    attribute :otp, String

    private

    def path
      "/api/v2/:coin/wallet/:wallet_id/tx/send"
    end

    def body
      { txHex: tx_hex, otp: otp }.to_json
    end

    def default_action
      :post
    end

  end
end
