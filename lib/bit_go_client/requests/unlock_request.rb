module BitGoClient
  class UnlockRequest < BaseRequest

    attribute :otp, String
    attribute :duration, Integer

    private

    def path
      "/api/v2/user/unlock"
    end

    def body
      h = {otp: otp}
      h[:duration] = duration if !duration.nil?
      h.to_json
    end

    def default_action
      :post
    end

  end
end
