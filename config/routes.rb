Rails.application.routes.draw do
  resources :reservations
  resources :courts
  resources :renters
  resources :visitors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
