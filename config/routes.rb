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
    resources :groups, only: [:new, :create]
    resources :goals, only: [:new, :create]
    resources :itineraries do
      resources :cities, only: [:new, :create]
    end
  end
  
  resources :groups do
    resources :group_members, only: [:new, :create]
  end

  resources :group_members
  resources :goals, only: [:edit, :update]
  
  resources :charts, only: [] do
    collection  do
      get 'new_users', to: 'charts#new_users'
      get 'trip_start', to: 'charts#trip_start'
      # get 'new_goals', to: 'charts#new_goals'
    end
  end

  get '/dashboard', to: 'dashboard#index'

end
