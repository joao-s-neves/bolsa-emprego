class User < ApplicationRecord
  has_one :candidate
  has_one :company
  accepts_nested_attributes_for :candidate
  accepts_nested_attributes_for :company

  before_save { self.email = email.downcase }
  #before_save :user_type
  validates :nome, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                              format: { with: VALID_EMAIL_REGEX },
                              uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  validates :morada, presence: true
  validates :cpostal, presence: true
  validates :localidade, presence: true
  validates :contacto, presence: true
  validates :pagina, presence: true
  validates :apresentacao, presence: true
  #validates :type, presence: true

  #def user_type
  # if params[:controller].to_s == 'users' && params[:action].to_s == 'create'
  #    @type = "C"
  #    @type.save
  #  elsif params[:controller].to_s ==  'companies' && params[:action].to_s == 'create'
  #    @type = "E"
  #   @type.save
  #  end
  #end

end
