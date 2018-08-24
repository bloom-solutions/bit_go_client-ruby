module BitGoClient
  class BaseResponse

    include APIClientBase::Response.module
    attribute :body, Object, lazy: true, default: :default_body

    private

    def default_body
      JSON.parse(raw_response.body)
    end

  end
end
