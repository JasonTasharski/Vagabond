class CitiesController < ApplicationController
  def show
  	@city = City.find_by(short_name:params[:short_name])
  	puts City.find_by(short_name:params[:short_name])
  	@posts = @city.posts.order(created_at: :desc).page(params[:page]).per(10)
  end
end
