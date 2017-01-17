class ProfessionalArea < ApplicationRecord
  #belongs_to :candidate
  has_many :candidates
end
