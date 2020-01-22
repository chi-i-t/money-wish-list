Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root :to => "devise/sessions#new"
  end
  
  resources :records, only: [:index, :create, :update, :destroy]
  resources :wishes, only: [:index, :create, :update, :destroy]
end

