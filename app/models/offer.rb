class Offer < ApplicationRecord
  belongs_to :company

  belongs_to :professional_activity
  #default_scope -> { order(created_at: :desc)
end
