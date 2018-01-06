Rails.application.routes.draw do
  get 'pages/home'

  get 'pages/about'

  get 'pages/contact'

  # Messages routes
  get 'messages',  to: 'messages#new', as: 'new_message'
  post 'messages', to: 'messages#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
end
