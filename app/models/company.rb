class Company < ApplicationRecord
  has_one :user
  accepts_nested_attributes_for :user

  belongs_to :professional_activity
  has_many :offers, dependent: :destroy

  validates :nif, presence: true

  def self.search(search)
    if search
      self.where("name like ?", "%#{search}%")
    else
      self.all
    end
  end
end
