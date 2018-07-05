Rails.application.routes.draw do
  devise_for :users
  # , controllers: {
    # registrations: 'users/registrations',
    # checking if user signs up
    # sessions: 'users/sessions'
    # checking if user is logged into a session
  # }


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :trips do
    resources :groups, only: [:index, :new, :create]
    resources :goals, only: [:new, :create]
  end
  resources :groups do
    resources :group_members, only: [:new, :create]
  end
  resources :group_members

  resources :itineraries do
    resources :cities, only: [:new, :create]
  end

  get '/dashboard', to: 'dashboard#index'
end
