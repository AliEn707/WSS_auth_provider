module Api::V1
  class ApiController < ::ApplicationController
    private
    def current_resource_owner
		if doorkeeper_token
			User.find(doorkeeper_token.resource_owner_id) 
		end
    end
  end
end