# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
	5.times do 
		user_params = Hash.new
  	user_params[:username] = FFaker::Lorem.words(1)
  	user_params[:first_name] = FFaker::Name.first_name
  	user_params[:last_name] = FFaker::Name.last_name
  	user_params[:email] = FFaker::Internet.email
  	user_params[:password] = "password"
  	user_params[:password_confirmation] = user_params[:password]
  	@user = User.create(user_params)
  end


  User.all.each do |user|
    3.times do
      post_params = Hash.new
      post_params[:title] = FFaker::HipsterIpsum.sentence(1)
      post_params[:body] = FFaker::HipsterIpsum.sentence(5)
      @post = user.posts.create(post_params)
    end
  end


