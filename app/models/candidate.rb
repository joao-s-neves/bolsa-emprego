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
end
