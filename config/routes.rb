Rails.application.routes.draw do

  resources :posts
  namespace :api do
    resources :users, only: [:index, :show, :create, :update, :destroy]
  end

end
