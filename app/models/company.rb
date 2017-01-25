class Company < ApplicationRecord
  has_one :user
  accepts_nested_attributes_for :user

  belongs_to :professional_activity
  has_many :offers, dependent: :destroy

  validates :nif, presence: true

#scope :activity, -> (location_id) { where location_id: location_id }

def self.search(search)
  if search
    #references(:users).
      #where("users.name LIKE " "%#{search}%")

    #includes(:user).find(:all, :conditions => ['user.name LIKE ?', "%#{search}%"])
    joins(:user).where('users.name LIKE ?', "%#{search}%")
  else
    includes(:user).find(:all)
  end
end

end
