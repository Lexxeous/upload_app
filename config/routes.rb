Rails.application.routes.draw do
  root 'uploads#new'
  get 'uploads/new'
  get 'uploads/create'
  get 'uploads/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :uploads
end
