Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :ingredients
  resources :recipes
  resources :users do
  	resources :recipes, only: [:index, :show]
  end

end