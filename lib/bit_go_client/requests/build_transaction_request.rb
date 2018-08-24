module BitGoClient
  class BuildTransactionRequest < BaseRequest

    attribute :coin, String
    attribute :wallet_id, String
    attribute :recipients, Array[Hash]

    private

    def path
      "/api/v2/:coin/wallet/:wallet_id/tx/build"
    end

    def body
      { recipients: recipients }.to_json
    end

    def default_action
      :post
    end

  end
end
