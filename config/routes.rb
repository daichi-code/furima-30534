Rails.application.routes.draw do
  get 'items/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users
  
  root to: "items#index"
end
