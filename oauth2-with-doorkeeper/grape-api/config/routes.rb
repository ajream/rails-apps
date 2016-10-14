Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users
  get 'pages/welcome'
  mount API => '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#welcome"
end
