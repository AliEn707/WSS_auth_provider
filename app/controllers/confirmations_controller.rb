class ConfirmationsController < Devise::ConfirmationsController
	def show
		cookies["redirect_uri"]=params["redirect_uri"]
		super
	end
  protected
    def after_confirmation_path_for(resource_name, resource)
		cookies["redirect_uri"] || root_path
    end
end