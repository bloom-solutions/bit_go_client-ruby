module BitGoClient
  class Client
    include APIClientBase::Client.module(default_opts: :default_opts)
    api_action :unlock
    api_action :build_transaction
    api_action :sign_transaction
    api_action :send_transaction

    private

    def default_opts
      { host: host, access_token: access_token }
    end
  end
end
