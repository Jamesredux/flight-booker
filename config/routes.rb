Rails.application.routes.draw do
 

  

	root 'flights#index'
  get 'flights/index'
  
  get '/about', to: 'flights#about'

  resources :bookings, only: [:new, :create, :show, :destroy] 
  




end
