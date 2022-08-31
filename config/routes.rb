Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  root "events#index"

  get "my_events", to: "user_events#index"
  resources :events
end
