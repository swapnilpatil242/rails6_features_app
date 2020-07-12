class Api::V1::ApiBaseController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :api_authenticate, if: :api_request?

  def api_authenticate
    unless ENV["API_SECRETE_TOKEN"] == request.headers["API-SECRETE-TOKEN"]
      render json: { data: "UnAuthorized request" }, status: :unauthorized
    end
  end

  # protected
  # def scrub_query_parameters!
  #   params.reject! { |p| request.query_parameters.include? p }
  # end

  private
  def api_request?
    request.format.json?
  end
end
