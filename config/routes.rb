Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :statuses
  root to: "statuses#index"

end
