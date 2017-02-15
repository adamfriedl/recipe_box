Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :ingredients
  resources :recipes, only: [:index, :show]
  resources :users do 
  	resources :recipes, only: [:index, :new, :create, :show]
  end

end