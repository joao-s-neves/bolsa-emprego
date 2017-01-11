class Company < ApplicationRecord
  belongs_to :user

  validates :nif, presence: true
  validates :atividade_profissional, presence: true
end
