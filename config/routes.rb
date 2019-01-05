Rails.application.routes.draw do
  get 'bookings/new'

  get 'bookings/show'

	root 'flights#index'
  get 'flights/index'
  get 'bookings/search'

  #resources :passengers
  resources :bookings
end
