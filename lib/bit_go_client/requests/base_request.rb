module BitGoClient
  class BaseRequest

    include APIClientBase::Request.module
    attribute :access_token, String

    private

    def headers
      {
        "Content-Type" => "application/json",
        "Authorization" => "Bearer #{access_token}"
      }
    end

  end
end
