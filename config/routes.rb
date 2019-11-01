Rails.application.routes.draw do
	devise_for :users, controllers: {
		registrations: 'users/registrations'
	}

	resources :flights do
		collection do
			post :confirm
		end
	end

	resources :users
end