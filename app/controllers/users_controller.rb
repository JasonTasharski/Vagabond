class UsersController < ApplicationController
  #form to create new user
  def new
    if current_user
      redirect_to profile_path
    else
      @user = User.new
      render :new
    end
  end

  #create new user in db
  def create
    if current_user
      redirect_to profile_path
    else
  	  @user = User.new(user_params)
  	  if @user.save
  		  session[:user_id] = @user.id
  		  redirect_to profile_path
  	  else
  		  redirect_to root_path
  	  end
    end
  end

  #update the profile page
  def update
    if current_user
      #get updated data
      updated_attributes = params.require(:user).permit(:username, :first_name, :last_name, :current_city)
      # update the creature
      current_user.update_attributes(updated_attributes)
      redirect_to profile_path
    else
      redirect_to root_path
    end
  end

  #show profile page
  def show
    @posts = Post.all
  	@user = current_user
  	render :show
  end

  #private methods
  private
  	def user_params
  		params.require(:user).permit(:username, :first_name, :last_name, :password, :email, :current_city)
  	end
end
