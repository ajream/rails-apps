Rails.application.routes.draw do
  devise_for :users
  resources :links do
  	member do 
  		put 'like', 		to: "links#up_vote"
  		put 'dislike', 	to: "links#down_vote"
  	end
  end
  root to: 'links#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
