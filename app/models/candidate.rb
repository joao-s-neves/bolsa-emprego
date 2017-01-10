class Candidate < ApplicationRecord
  belongs_to :user

  validates :d_nascimento, presence: true
  validates :cartao_cidadao, presence: true
  validates :area_profissional, presence: true
  validates :hab_literarias, presence: true
  validates :hab_ds, presence: true
  validates :situacao, presence: true
  validates :experiencia, presence: true
end
