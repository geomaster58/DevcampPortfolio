Rails.application.routes.draw do


  
  namespace :admin do
    resources :users
    resources :blogs
    resources :comments
    resources :portfolios
    resources :skills
    resources :technologies
    resources :topics
    resources :guest_users

    root to: "users#index"
  end

  resources :topics, only: [:index, :show]

  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end

  get 'tech-news', to: 'pages#tech_news'
  get 'angularitems', to: 'portfolios#angular'
  get 'railsitems' , to: 'portfolios#rails'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  get 'contact', to: "pages#contact"
  get "about-me", to: "pages#about"

  resources :blogs do 

    member do
      get :toggle_status
    end
  end

  mount ActionCable.server => '/cable'
  
  root to: "pages#home"
end
