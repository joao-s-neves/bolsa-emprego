class Company < ApplicationRecord
  belongs_to :user
  before_save { self.email = email.downcase }
  validates :nif, presence: true
  validates :atividade_profissional, presence: true
  #validates :apresentacao, presence: true
end
