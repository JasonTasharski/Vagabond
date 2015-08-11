class User < ActiveRecord::Base
	has_secure_password
	has_many :posts, dependent: :destroy

	def to_param
	  "#{username}"
	end
end