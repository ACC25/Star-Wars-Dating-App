Rails.application.routes.draw do
  root 'sessions#show'

  resources :dashboards, only: [:index, :show]

  resources :users, only: [:new, :show, :create, :index]

  get '/', to: 'sessions#show'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
