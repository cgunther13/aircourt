Rails.application.routes.draw do
  root :to => "visitors#index"
  resources :vistor_reviews
  resources :court_reviews
  resources :reservations
  resources :courts
  resources :renters
  resources :visitors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
