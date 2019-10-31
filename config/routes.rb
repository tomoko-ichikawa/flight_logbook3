Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  devise_for :users
	resources :flights do
		collection do
			post :confirm
		end
	end
end