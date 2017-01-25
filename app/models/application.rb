class Application < ApplicationRecord
  belongs_to :follower, class_name: "Candidate"
  belongs_to :followed, class_name: "Offer"

  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
