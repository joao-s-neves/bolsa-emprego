class ProfessionalActivity < ApplicationRecord
  has_many :companies
  has_many :offers
end
