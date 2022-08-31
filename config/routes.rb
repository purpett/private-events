Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  root "events#index"
  resources :events
end
