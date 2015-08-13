class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :city
  validates :title, length: {minimum: 1, maximum: 200, too_long: "Max 200 characters", too_short: "Minimum 1 character"}
  validates :body, presence: true

  # has_attached_file :photo,
  #                  :styles => { :medium => "700x700>", :thumb => "44x44#" },
  #                  :default_url => "/profile-placeholder.jpg"

  # validates_attachment :photo, :presence => true,
  #                     :content_type => { :content_type => ["image/jpeg", "image/png"] },
  #                     :size => { :in => 0..4200.kilobytes }

  extend FriendlyId
    friendly_id :title, use: [:slugged, :finders]
end
