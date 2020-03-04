Rails.application.routes.draw do
  devise_for :users
    
  devise_scope :user do
    root :to => "devise/sessions#new"
  end
  resources :wishes, only: [:index, :create, :update, :destroy]
  resources :records, only: [:index, :create, :update, :destroy]
  resources :users, only: :show
  

end

