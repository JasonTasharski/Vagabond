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

	has_attached_file :avatar,
                   :styles => { :medium => "150x150>", :thumb => "44x44#" },
                   :default_url => "/profile-placeholder.jpg"

 	validates_attachment :avatar, :presence => true,
                      :content_type => { :content_type => ["image/jpeg", "image/png"] },
                      :size => { :in => 0..1200.kilobytes }
end