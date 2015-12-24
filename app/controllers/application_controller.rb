class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	
	def wait_confirmation
	end
	
	def set_locale
		I18n.locale=cookies[:locale] if !cookies[:locale].nil?
		if !current_user.nil?
			I18n.locale=current_user.locale
			if !params[:locale].nil?
				current_user.locale=params[:locale]
				current_user.save
				redirect_to :back
			end
		else
			if !params[:locale].nil?
				cookies[:locale]=params[:locale]
				redirect_to :back
			end
		end
	end
end
