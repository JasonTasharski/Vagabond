class User < ActiveRecord::Base
	has_secure_password
	has_many :posts, dependent: :destroy

	validates :email, presence: true, uniqueness: true
	validates :username, presence: true, uniqueness: true
	validates :password, confirmation: true
	# validates :password_confirmation, presence: true

	def to_param
	  "#{username}"
	end
end