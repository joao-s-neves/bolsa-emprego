class User < ApplicationRecord
  attr_accessor :remember_token, :activation_token, :reset_token,
                         :validate_email, :validate_password, :current_password,
                         :validate_address, :validate_zip_code, :validate_city,
                         :validate_contact, :validate_page, :validate_presentation
  belongs_to :company, required: false, dependent: :destroy
  belongs_to :candidate, required: false, dependent: :destroy
  has_many :active_relationships,  class_name:  "Relationship",
                                   foreign_key: "follower_id",
                                   dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower


  before_create :create_activation_digest
  before_save   :downcase_email
  enum user_type: { candidate: 1, company: 2, backoffice: 3 }

  mount_uploader :picture, PictureUploader


  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                              format: { with: VALID_EMAIL_REGEX },
                              uniqueness: { case_sensitive: false }, if: :validate_email?
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, if: :validate_password?
  validates :password_confirmation, presence: true, if: :validate_password?
  validates :address, presence: true, if: :validate_address?
  validates :zip_code, presence: true, if: :validate_zip_code?
  validates :city, presence: true, if: :validate_city?
  validates :contact, presence: true, if: :validate_contact?
  validates :page, presence: true, if: :validate_page?
  validates :presentation, presence: true, if: :validate_presentation?
  #validates :type, presence: true
  #validate :current_password_is_correct, on: :update

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  # Activates an account.
  def activate
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end

  # Sends activation email.
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def validate_address?
    validate_address
  end

  def validate_zip_code?
    validate_zip_code
  end

  def validate_city?
    validate_city
  end

  def validate_contact?
    validate_contact
  end

  def validate_page?
    validate_page
  end

  def validate_presentation?
    validate_presentation
  end

  def validate_email?
    validate_email
  end

def validate_password?
  validate_password
end

  # Follows a user.
  def follow(other_user)
    following << other_user
  end

  # Unfollows a user.
  def unfollow(other_user)
    following.delete(other_user)
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end


  private

    # Converts email to all lower-case.
    def downcase_email
      self.email = email.downcase
    end

    # Creates and assigns the activation token and digest.
    def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
    end
end
