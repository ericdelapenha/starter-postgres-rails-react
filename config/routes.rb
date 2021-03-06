Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'post#index'

  namespace :api, defaults: { format: :json } do
    resources :post, only: [:index, :create, :show, :update, :destroy]
  end
end
