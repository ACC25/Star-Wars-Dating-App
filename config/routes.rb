Rails.application.routes.draw do
  root "dashboards#index"
  
  resources :dashboards, only: [:index]

  resources :user, only: [:new, :show, :create, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
