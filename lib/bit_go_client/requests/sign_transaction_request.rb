module BitGoClient
  class SignTransactionRequest < BaseRequest

    attribute :coin, String
    attribute :wallet_id, String
    attribute :tx_prebuild, Hash
    attribute :keychain, Object
    attribute :tx_prebuild, Hash
    attribute :wallet_passphrase, String

    private

    def path
      "/api/v2/:coin/wallet/:wallet_id/signtx"
    end

    def body
      h = { txPrebuild: tx_prebuild }
      h[:keychain] = keychain if keychain.present?
      h[:walletPassphrase] = wallet_passphrase if wallet_passphrase.present?
      h.to_json
    end

    def default_action
      :post
    end

  end
end
