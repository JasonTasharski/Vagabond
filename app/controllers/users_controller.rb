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
        flash[:notice] = "Complete your profile!"
  	  else
  		  redirect_to signup_path
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
    @user = current_user
    @posts = @user.posts
    session[:return_to] = profile_path
    
  	render :show
  end

  #private methods
  private
  	def user_params
  		params.require(:user).permit(:avatar, :username, :first_name, :last_name, :password, :password_confirmation, :email, :current_city)
  	end
end
