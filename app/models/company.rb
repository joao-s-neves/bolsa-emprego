class Company < ApplicationRecord
  has_one :user
  accepts_nested_attributes_for :user

  has_one :professional_activity
  has_many :offers, dependent: :destroy

  validates :nif, presence: true
end
