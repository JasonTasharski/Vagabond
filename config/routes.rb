Rails.application.routes.draw do
  
  #route to edit form

  #route to update database
  put "profile/update", to: "profile#update"


  #signup routes
  get "/signup", to: "users#new"
  get "/profile", to: "users#show"
  resources :users, except: [:new, :show] do 
    resources :posts
  end

  #session routes
  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  resources :sessions, only: [:create]
  #other shit

  root to: "home#index"


end

#         Prefix Verb   URI Pattern                              Controller#Action
#         signup GET    /signup(.:format)                        users#new
#        profile GET    /profile(.:format)                       users#show
#     user_posts GET    /users/:user_id/posts(.:format)          posts#index
#                POST   /users/:user_id/posts(.:format)          posts#create
#  new_user_post GET    /users/:user_id/posts/new(.:format)      posts#new
# edit_user_post GET    /users/:user_id/posts/:id/edit(.:format) posts#edit
#      user_post GET    /users/:user_id/posts/:id(.:format)      posts#show
#                PATCH  /users/:user_id/posts/:id(.:format)      posts#update
#                PUT    /users/:user_id/posts/:id(.:format)      posts#update
#                DELETE /users/:user_id/posts/:id(.:format)      posts#destroy
#          users GET    /users(.:format)                         users#index
#                POST   /users(.:format)                         users#create
#      edit_user GET    /users/:id/edit(.:format)                users#edit
#           user PATCH  /users/:id(.:format)                     users#update
#                PUT    /users/:id(.:format)                     users#update
#                DELETE /users/:id(.:format)                     users#destroy
#          login GET    /login(.:format)                         sessions#new
#         logout GET    /logout(.:format)                        sessions#destroy
#       sessions POST   /sessions(.:format)                      sessions#create
#           root GET    /                                        home#index



