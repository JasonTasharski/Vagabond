# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
	5.times do 
		user_params = Hash.new
  	user_params[:username] = FFaker::Name.first_name
  	user_params[:first_name] = FFaker::Name.first_name
  	user_params[:last_name] = FFaker::Name.last_name
  	user_params[:email] = FFaker::Internet.email
    user_params[:current_city] = rand(1..3)
  	user_params[:password] = "password"
  	user_params[:password_confirmation] = user_params[:password]
  	@user = User.create!(user_params)
  end


  User.all.each do |user|
    3.times do
      post_params = Hash.new
      post_params[:title] = FFaker::HipsterIpsum.sentence(1)
      post_params[:body] = FFaker::HipsterIpsum.sentence(5)
      post_params[:city_id] = rand(1..3)
      @post = user.posts.create!(post_params)
    end
  end


san_francisco = Hash.new
san_francisco[:city_description] = "San Francisco, officially the City and County of San Francisco, is the cultural, commercial, and financial center of Northern California and the only consolidated city-county in California. San Francisco encompasses a land area of about 46.9 square miles (121 km2) on the northern end of the San Francisco Peninsula, which makes it the smallest county in the state."
san_francisco[:city_name] = "San Francisco"
san_francisco[:short_name] = "sf"
san_francisco[:city_photo] = "/cities/sanfrancisco.jpg"
san_francisco[:latitude] = "37.783"
san_francisco[:longitude] = "-122.416"
@city = City.create(san_francisco)

london = Hash.new
london[:city_name] = "London"
london[:city_description] = "London is the capital and most populous city of England and the United Kingdom. Standing on the River Thames, London has been a major settlement for two millennia, its history going back to its founding by the Romans, who named it Londinium. London's ancient core, the City of London, largely retains its 1.12-square-mile (2.9 km2) medieval boundaries and in 2011 had a resident population of 7,375, making it the smallest city in England."
london[:short_name] = "lon"
london[:city_photo] = "/cities/london.jpg"
london[:latitude] = "51.507"
london[:longitude] = "0.127"
@city = City.create(london)

gibraltar = Hash.new
gibraltar[:city_name] = "Gibraltar"
gibraltar[:city_description] = "Gibraltar is a British Overseas Territory located on the southern end of the Iberian Peninsula at the entrance of the Mediterranean. It has an area of 6.0 km2 (2.3 sq mi) and shares its northern border with the Province of Cádiz in Andalusia, Spain. The Rock of Gibraltar is the major landmark of the region. At its foot is a densely populated city area, home to almost 30,000 Gibraltarians and other nationalities."
gibraltar[:short_name] = "gib"
gibraltar[:city_photo] = "/cities/gibraltar.jpg"
gibraltar[:latitude] = "36.143"
gibraltar[:longitude] = "-5.353"
@city = City.create(gibraltar)
