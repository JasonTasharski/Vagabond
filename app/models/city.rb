class City < ActiveRecord::Base
	has_many :posts, dependent: :destroy
	def to_param
	  "#{short_name}"
	end
end
