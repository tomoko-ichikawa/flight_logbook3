Rails.application.routes.draw do
	resources :flights do
		collection do
			post :confirm
		end
	end
end