WssAuth::Application.routes.draw do
	use_doorkeeper
	devise_for :users, controllers: { 
		registrations: 'registrations', 
		confirmations: 'confirmations',
		sessions: "sessions"
	}
	devise_scope :user do
		get '/users/sign_out', :to => 'devise/sessions#destroy'
	end
	namespace :api do
		namespace :v1 do
			# another api routes
			get '/me' => "credentials#me"
			patch '/lang/:lang' => "credentials#me"
		end
	end
	get "/registration_success" => "application#wait_confirmation", as: "registration_success"
	
	get "locale", to: "application#set_locale"
end
