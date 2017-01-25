class Offer < ApplicationRecord
  belongs_to :company

  belongs_to :professional_activity
  #default_scope -> { order(created_at: :desc)
  #
  has_many :passive_applications, class_name: "Application",
                                                         foreign_key: "followed_id",
                                                         dependent:    :destroy
  has_many :followers, through: :passive_applications, source: :follower
end
