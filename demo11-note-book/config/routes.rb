Rails.application.routes.draw do
  devise_for :users

  resources :notes

  authenticated :user do
  	root to: 'notes#index'
  end
  
  root to: 'welcome#index'
end
