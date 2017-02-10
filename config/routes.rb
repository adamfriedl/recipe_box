Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :users, only: :show do
  	resources :recipes, only: [:index, :show]
  end
  resources :recipes
  resources :ingredients

  root 'recipes#index'

end
