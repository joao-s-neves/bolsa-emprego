class Candidate < ApplicationRecord
  has_one :user
  accepts_nested_attributes_for :user

  belongs_to :habilitation, required: false
  belongs_to :professional_area
  belongs_to :professional_situation

  validates :birth_date, presence: true
  validates :document, presence: true
  validates :habilitation_description, presence: true
  validates :experience, presence: true

  has_many :active_applications, class_name: "Application",
                                                      foreign_key: "follower_id",
                                                      dependent:    :destroy
  has_many :following, through: :active_applications, source: :followed

  def follow(offer)
    following << offer
  end

  # Unfollows a user.
  def unfollow(offer)
    following.delete(offer)
  end

  # Returns true if the current user is following the other user.
  def following?(offer)
    following.include?(offer)
  end
end
