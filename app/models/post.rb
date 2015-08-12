class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :city
  validates :title, length: {minimum: 1, maximum: 200, too_long: "Max 200 characters", too_short: "Minimum 1 character"}
  validates :body, presence: true
end
