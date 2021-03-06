class RegistrationsController < Devise::RegistrationsController
	def create
		if verify_recaptcha
			Thread.current["actiondispatch.request"] = request
			super
		else
			build_resource(sign_up_params)
			clean_up_passwords(resource)
			flash.now[:alert] = t("recaptcha_error")      
			flash.delete :recaptcha_error
			render :new
		end
	end
	
	def new
		super
	end
	
	def after_inactive_sign_up_path_for(resource)
		registration_success_path
	end
	
	private
	
	def sign_up_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation,:current_password, :locale, :time_zone)
	end

	def account_update_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation,:current_password, :locale, :time_zone)
	end
end