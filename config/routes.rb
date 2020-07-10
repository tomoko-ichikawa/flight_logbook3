Rails.application.routes.draw do
  get 'pages/home'
  resources :contacts
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'comments/create'
  get 'comments/destroy'
  get 'favorites/create'
  get 'favorites/destroy'
  get 'contacts/create'
  get 'contacts/destroy'

	devise_for :users, controllers: {
		registrations: 'users/registrations'
	}

	resources :flights do
		resource :favorites, only:[:create, :destroy]
		resource :comments, only:[:create, :destroy]
		collection do
			post :confirm
		end
	end

	resources :users

	# namespace :admin do
	# 	resources :users
	# end

  root to: 'pages#home'

	mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end