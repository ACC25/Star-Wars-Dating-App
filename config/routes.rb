Rails.application.routes.draw do
  root 'sessions#show'

  namespace :admin do
    resources :overview, only: [:index]
  end

  resources :users, only: [:new, :show, :create, :index] do
    resources :dashboards, only: [:index, :show]
    resources :favourites, only: [:index, :new]
  end

  get '/search', to: 'searches#new'
  post '/search', to: 'searches#create'
  get '/search/results', to: 'searches#show'

  get '/', to: 'sessions#show'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
