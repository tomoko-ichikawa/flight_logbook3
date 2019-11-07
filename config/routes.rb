Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
	devise_for :users, controllers: {
		registrations: 'users/registrations'
	}

	resources :flights do
		resource :favorites, only:[:create, :destroy]
		collection do
			post :confirm
		end
	end

	resources :users
end