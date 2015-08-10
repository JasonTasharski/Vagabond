require 'rails_helper'

RSpec.describe User, type: :model do
  before do
  	user_params = Hash.new
  	user_params[:username] = FFaker::Lorem.words(1)
  	user_params[:first_name] = FFaker::Name.first_name
  	user_params[:last_name] = FFaker::Name.last_name
  	user_params[:email] = FFaker::Internet.email
  	user_params[:password] = FFaker::Lorem.words(2).join
  	user_params[:password_confirmation] = user_params[:password]
  	@user = User.create(user_params)
  end

  describe "Signing up a new account" do
  	it "save user to database" do
  		all_users = User.all
  		expect(all_users.count).to eq(1)
  	end

  	it "redirects to profile page" do
  		get :show
  		expect(response).to render_template(:show)
  	end
  end
end
