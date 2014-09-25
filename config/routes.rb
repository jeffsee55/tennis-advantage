Rails.application.routes.draw do

  resources :programs do
    collection do
      get :competitions
    end
  end

  mount Ckeditor::Engine => '/ckeditor'
  root to: 'pages#home'

  devise_for :users, :controllers => { registrations: 'registrations' }

  get 'home', to: 'pages#home', as: '/'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  resources :users, only: [:index, :show]
  resources :inquiries, only: [:new, :create]
  resources :locations, only: [:index, :show]
  resources :programs, only: [:index, :show]
  resources :posts, only: [:index, :show] do
    collection do
      get :recent
    end
  end

  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  authenticate :user do
    namespace :admin do
      get '', to: 'dashboard#index', as: '/'
      resources :users
      resources :inquiries
      resources :locations
      resources :posts
      resources :programs
      resources :program_categories
    end
  end
end
