class PostsController < ApplicationController
	def index #DONT REALLY NEED... yet
		render :index
	end

	def create
		user = current_user
		post = current_user.posts.create(post_params)
		redirect_to user_post_path(user, post)
	end

	def new
		@user = current_user
		@post = Post.new
		render :new
	end

	def edit
		@user = current_user
		@post = Post.find(params[:id])
		render :edit
	end

	def show
		@post = Post.find(params[:id])
		render :show
	end

	def update
		@post = Post.find(params[:id])
		@post.update_attributes(post_params)
		redirect_to profile_path
	end

	def destroy
		Post.find(params[:id]).destroy
		redirect_to profile_path
	end

	private
	def post_params
		params.require(:post).permit(:title, :body)
	end

end

#     user_posts GET    /users/:user_id/posts(.:format)          posts#index
#                POST   /users/:user_id/posts(.:format)          posts#create
#  new_user_post GET    /users/:user_id/posts/new(.:format)      posts#new
# edit_user_post GET    /users/:user_id/posts/:id/edit(.:format) posts#edit
#      user_post GET    /users/:user_id/posts/:id(.:format)      posts#show
#                PATCH  /users/:user_id/posts/:id(.:format)      posts#update
#                PUT    /users/:user_id/posts/:id(.:format)      posts#update
#                DELETE /users/:user_id/posts/:id(.:format)      posts#destroy