class User < ActiveRecord::Base
	has_secure_password
	has_many :posts, dependent: :destroy

	validates :email, presence: true, uniqueness: true
	validates :username, presence: true, uniqueness: true
	validates :password, confirmation: true
	# validates :password_confirmation, presence: true

  has_attached_file :avatar,
                   :styles => { :medium => "150x150>", :thumb => "44x44#>" },
                   :default_url => "/images/:style/missing.png"

 validates_attachment :avatar, :presence => true,
                      :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
                      :size => { :in => 0..10.kilobytes }
end

	def to_param
	  "#{username}"
	end
