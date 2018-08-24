require "api_client_base"
require "typhoeus"

module BitGoClient

  include APIClientBase::Base.module

  with_configuration do
    has :host, classes: [NilClass, String]
    has :access_token, classes: [NilClass, String]
  end

end

require "bit_go_client/version"
require "bit_go_client/client"
require "bit_go_client/requests/base_request"
require "bit_go_client/requests/unlock_request"
require "bit_go_client/requests/build_transaction_request"
require "bit_go_client/requests/sign_transaction_request"
require "bit_go_client/requests/send_transaction_request"
require "bit_go_client/responses/base_response"
require "bit_go_client/responses/unlock_response"
require "bit_go_client/responses/build_transaction_response"
require "bit_go_client/responses/sign_transaction_response"
require "bit_go_client/responses/send_transaction_response"
