class User < ActiveRecord::Base
	has_secure_password
	has_many :posts, dependent: :destroy

	validates :current_city, :presence => true
	validates :email, :presence => true, uniqueness: true
	validates :username, :presence => true, uniqueness: true
	validates :password, :presence => true, confirmation: true
	# validates :password_confirmation, presence: true

	has_attached_file :avatar,
	:styles => { :medium => "150x150>" },
	:default_url => "/images/:style/missing.png"

	validates_attachment :avatar,
	:content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
	:size => { :in => 0..10000.kilobytes }

	extend FriendlyId
	friendly_id :username, use: [:slugged, :finders]

end

