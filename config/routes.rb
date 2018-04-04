Rails.application.routes.draw do
  root "welcome#index"
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/signup', to: 'customers#new'
  resources :users do
    get :confirm_email, on: :member
    get :reset_password, on: :member
    get :forgot_password, on: :collection
    post :send_reset_password_email, on: :collection
    patch :update_password, on: :member
  end

  resources :customers, only: :create

  resources :orders
  resources :line_items
  resources :deals
  resources :addresses do
    post :submit, on: :collection
  end

  get '/live_deal', to: 'welcome#live_deal'

  scope '/countries/:country_id' do
    resources :states, only: :index
  end

  resources :payments

  namespace :admins do
    root 'dashboard#index'
    resources :users
    resources :deals
    resources :orders
  end
end

