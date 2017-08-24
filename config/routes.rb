Rails.application.routes.draw do
<<<<<<< HEAD
  get 'pages/homepage'
=======
  get 'pages/home'
>>>>>>> bb45cee2089260ec9324d693526cf4ae62991598

  get 'pages/about'

  get 'pages/contact'

  resources :blogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
