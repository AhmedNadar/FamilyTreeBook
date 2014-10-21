Rails.application.routes.draw do
  get 'settings/show'

  devise_for :users, :controllers => { registrations: 'registrations' }

  devise_scope :user do
	  get "login", to: "devise/sessions#new", as: :login
	  get "join", to: "registrations#new", as: :join
	  get "logout", to: "devise/sessions#destroy", as: :logout
	  get "profile", to: "registrations#edit", as: :profile
	end

  resources :statuses
  get "feeds", to: "statuses#index", as: :feeds
  root "statuses#index"

  get "/:id", to: "settings#show"
end
