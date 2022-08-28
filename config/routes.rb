Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create, :update, :destroy]
  resources :reminders, only: [:index, :show, :create, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

      # resources :owners
      # resources :foodtrucks
      # resources :schedules
      # resources :menus
      # resources :items
      # resources :ratings
      # resources :notes 
      post '/login', to: 'auth#create'
      # get '/profile', to: 'foodtrucks#profile'
      # post '/search', to: 'foodtrucks#search'
      # post '/like', to: 'foodtrucks#like'
      # patch '/foodtrucks/:id/edit', to: 'foodtrucks#update'
end
