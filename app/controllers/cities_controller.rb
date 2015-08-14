class CitiesController < ApplicationController
  def show
  	@user = current_user
  	@city = City.find_by(short_name:params[:short_name])
  	session[:return_to] = city_path(@city)

  	@posts = @city.posts.order(created_at: :desc).page(params[:page]).per(10)
  end
end
