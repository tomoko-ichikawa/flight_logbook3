Rails.application.routes.draw do
	devise_for :users
	resources :flights do
		collection do
			post :confirm
		end
	end

	resources :users
end