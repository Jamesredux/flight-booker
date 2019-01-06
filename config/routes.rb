Rails.application.routes.draw do
  get 'bookings/new'

  get 'bookings/show'

	root 'flights#index'
  get 'flights/index'
  get 'bookings/search'
  get '/about', to: 'flights#about'

  #resources :passengers
  resources :bookings
end
