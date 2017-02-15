Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  devise_scope :user do
  	root 'devise/sessions#new'
  end

  resources :ingredients
  resources :recipes, only: [:index, :show]
  resources :users do 
  	resources :recipes, only: [:index, :new, :create, :show]
  end

end