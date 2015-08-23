Myflix::Application.routes.draw do
  root to: 'static_pages#front' 
  get '/home', to: 'videos#index'
  get 'ui(/:action)', controller: 'ui'

  resources :videos, only: :show do
    collection do 
      get 'search', to: 'videos#search'
    end

    resources :reviews, only: [:create]
  end

  resources :users, only: :show
  get 'people', to: 'relationships#index'
  resources :relationships, only: [:destroy]
  
  resources :categories, only: :show
  resources :queue_items, only: [:create, :destroy]
  post 'update_queue', to: 'queue_items#update_queue'

  get '/my_queue', to: 'queue_items#index'
  get '/register', to: 'users#new'
  get '/sign_in', to: 'sessions#new'
  get '/sign_out', to: 'sessions#destroy'

  resources :users, only: :create
  resources :sessions, only: :create

end
