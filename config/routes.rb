Rails.application.routes.draw do
  resources :statuses
  root to: "statuses#index"

end
