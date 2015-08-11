class CitiesController < ApplicationController
  def show
  	@city = City.find_by(short_name:params[:short_name])
  	@posts = @city.posts.order(created_at: :desc)
  end
end
