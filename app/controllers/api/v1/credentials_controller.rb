module Api::V1
  class CredentialsController < ApiController
    before_action :doorkeeper_authorize!
    respond_to     :json

    def me
		sign_out current_user if current_user
		respond_with current_resource_owner
    end
  end
end