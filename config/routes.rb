Rails.application.routes.draw do

  root to: "home#index"

  #signup routes
  get "/signup", to: "users#new"
  get "/profile", to: "users#show"
  resources :users, except: [:new, :show], path: "/profile" do 
    resources :posts, exept: [:index]
  end

  #session routes
  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  resources :sessions, only: [:create]
  #other shit

  resources :cities, only: [:show], param: :short_name

end

#         Prefix Verb   URI Pattern                              Controller#Action
#           root GET    /                                        home#index
#         signup GET    /signup(.:format)                        users#new
#        profile GET    /profile(.:format)                       users#show
#     user_posts GET    /users/:user_id/posts(.:format)          posts#index {:exept=>[:index]}
#                POST   /users/:user_id/posts(.:format)          posts#create {:exept=>[:index]}
#  new_user_post GET    /users/:user_id/posts/new(.:format)      posts#new {:exept=>[:index]}
# edit_user_post GET    /users/:user_id/posts/:id/edit(.:format) posts#edit {:exept=>[:index]}
#      user_post GET    /users/:user_id/posts/:id(.:format)      posts#show {:exept=>[:index]}
#                PATCH  /users/:user_id/posts/:id(.:format)      posts#update {:exept=>[:index]}
#                PUT    /users/:user_id/posts/:id(.:format)      posts#update {:exept=>[:index]}
#                DELETE /users/:user_id/posts/:id(.:format)      posts#destroy {:exept=>[:index]}
#          users GET    /users(.:format)                         users#index
#                POST   /users(.:format)                         users#create
#      edit_user GET    /users/:id/edit(.:format)                users#edit
#           user PATCH  /users/:id(.:format)                     users#update
#                PUT    /users/:id(.:format)                     users#update
#                DELETE /users/:id(.:format)                     users#destroy
#          login GET    /login(.:format)                         sessions#new
#         logout GET    /logout(.:format)                        sessions#destroy
#       sessions POST   /sessions(.:format)                      sessions#create
#           city GET    /cities/:short_name(.:format)            cities#show




