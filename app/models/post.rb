class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :city
  validates :title, length: {minimum: 1, maximum: 200, too_long: "Max 200 characters", too_short: "Minimum 1 character"}
  validates :body, presence: true

  has_attached_file :photo,
                   :styles => { :medium => "700x700>", :small =>"400x400>" },
                   :default_url => 'http://thecatapi.com/api/images/get?format=src&size=small',
                   :escape_url => false,
                   :storage => :s3,
                   :s3_credentials => Proc.new { |a| a.instance.s3_credentials },
                   :s3_host_name => 's3-us-west-1.amazonaws.com'

  def s3_credentials
   { :bucket => ENV['S3_BUCKET'], :access_key_id => ENV['S3_PUBLIC_KEY'], :secret_access_key => ENV['S3_SECRET'] }
  end

  validates_attachment :photo,
                      :content_type => { :content_type => ["image/jpeg", "image/png"] },
                      :size => { :in => 0..4200.kilobytes }

  extend FriendlyId
    friendly_id :title, use: [:slugged, :finders]
end
