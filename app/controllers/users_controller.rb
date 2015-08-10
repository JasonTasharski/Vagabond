class UsersController < ApplicationController
  #form to create new user
  def new
  	@user = User.new
  	render :new
  end

  #create new user in db
  def create
  	@user = User.new(user_params)
  	if @user.save
  		session[:user_id] = @user.id
  		redirect_to profile_path
  	else
  		redirect_to root_path
  	end
  end

  #show profile page
  def show
  	@user = current_user
  	render :show
  end

  #private methods
  private
  	def user_params
  		params.require(:user).permit(:username, :first_name, :last_name, :password, :email, :current_city)
  	end
end
