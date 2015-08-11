Rails.application.routes.draw do

  root to: "home#index"

  #signup routes
  get "/signup", to: "users#new"
  get "/profile", to: "users#show"
  resources :users, except: [:new, :show], path: "/profile", param: :username do 
    resources :posts
  end

  #session routes
  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  resources :sessions, only: [:create]
  #other shit

  resources :cities, only: [:show], param: :short_name

end

#         signup GET    /signup(.:format)                                users#new
#        profile GET    /profile(.:format)                               users#show
#     user_posts GET    /profile/:user_username/posts(.:format)          posts#index
#                POST   /profile/:user_username/posts(.:format)          posts#create
#  new_user_post GET    /profile/:user_username/posts/new(.:format)      posts#new
# edit_user_post GET    /profile/:user_username/posts/:id/edit(.:format) posts#edit
#      user_post GET    /profile/:user_username/posts/:id(.:format)      posts#show
#                PATCH  /profile/:user_username/posts/:id(.:format)      posts#update
#                PUT    /profile/:user_username/posts/:id(.:format)      posts#update
#                DELETE /profile/:user_username/posts/:id(.:format)      posts#destroy
#          users GET    /profile(.:format)                               users#index
#                POST   /profile(.:format)                               users#create
#      edit_user GET    /profile/:username/edit(.:format)                users#edit
#           user PATCH  /profile/:username(.:format)                     users#update
#                PUT    /profile/:username(.:format)                     users#update
#                DELETE /profile/:username(.:format)                     users#destroy
#          login GET    /login(.:format)                                 sessions#new
#         logout GET    /logout(.:format)                                sessions#destroy
#       sessions POST   /sessions(.:format)                              sessions#create
#           city GET    /cities/:id(.:format)                            cities#show
#           root GET    /                                                home#index



