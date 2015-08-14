class User < ActiveRecord::Base
	has_secure_password
	has_many :posts, dependent: :destroy

	validates :email, :presence => true, uniqueness: true
	validates :username, :presence => true, uniqueness: true
	validates :password, :presence => true, confirmation: true
	# validates :password_confirmation, presence: true

	has_attached_file :avatar,
	:styles => { :medium => "150x150>" },
	:path => "avatars/:id/:style/avatar.:extension",
	:default_url => "/profile-placeholder.jpg",
	:storage => :s3,
    :s3_credentials => Proc.new { |a| a.instance.s3_credentials },
    :s3_host_name => 's3-us-west-1.amazonaws.com'

    def s3_credentials
	 { :bucket => ENV['S3_BUCKET'], :access_key_id => ENV['S3_PUBLIC_KEY'], :secret_access_key => ENV['S3_SECRET'] }
	end

	validates_attachment :avatar,
	:content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
	:size => { :in => 0..10000.kilobytes }

	extend FriendlyId
	friendly_id :username, use: [:slugged, :finders]

end

