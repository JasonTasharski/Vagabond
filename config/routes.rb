Rails.application.routes.draw do

  #route to edit form

  #route to update database
  put "profile/update", to: "profile#update"

  #signup routes
  get "/signup", to: "users#new"
  get "/profile", to: "users#show"
  resources :users, except: [:new, :show]

  #session routes
  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  resources :sessions, only: [:create]

  #other shit

  root to: "home#index"

#    signup GET    /signup(.:format)         users#new
#   profile GET    /profile(.:format)        users#show
#     users GET    /users(.:format)          users#index
#           POST   /users(.:format)          users#create
# edit_user GET    /users/:id/edit(.:format) users#edit
#      user PATCH  /users/:id(.:format)      users#update
#           PUT    /users/:id(.:format)      users#update
#           DELETE /users/:id(.:format)      users#destroy
#     login GET    /login(.:format)          sessions#new
#    logout GET    /logout(.:format)         sessions#destroy
#  sessions POST   /sessions(.:format)       sessions#create
#      root GET    /                         home#index


end
