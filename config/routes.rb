Rails.application.routes.draw do

  resources :programs do
    collection do
      get :competitions
    end
  end

  mount Ckeditor::Engine => '/ckeditor'
  root to: 'pages#home'

  get 'home', to: 'pages#home', as: '/'
  get 'news', to: 'pages#news'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'shop', to: 'pages#shop'

  resources :inquiries, only: [:new, :create]

  resources :locations, only: [:index, :show]

  resources :programs, only: [:index, :show]

  resources :products, only: [:index, :show]

  resources :cart_items

  resources :posts, only: [:index, :show] do
    collection do
      get :recent
    end
  end

  devise_for :users, :controllers => { registrations: 'users/registrations', sessions: 'users/sessions' }

  resources :users, only: [:index, :update, :show] do
    member do
      get 'cart', to: 'users#view_cart'
      resources :charges, only: [:new, :create, :show]
    end
  end

  authenticate :user do
    namespace :admin do
      get '', to: 'dashboard#index', as: '/admin'
      resources :inquiries, except: [:new, :create, :edit]
      resources :locations
      resources :posts
      resources :programs
      resources :program_categories
      resources :products
      resources :charges, only: [:index, :show, :update]
    end
  end
end
