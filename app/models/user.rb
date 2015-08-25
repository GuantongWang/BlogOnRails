class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  ROLES = ['admin', 'agency', 'member']
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  validates :phone, :name, presence: true
  validates :phone, uniqueness: true
  validates :email, uniqueness: true, unless: "email.blank?"

  attr_accessor :login

  def login=(login)
    @login = login
  end

  def login
    @login || self.phone || self.email
  end

  def active_for_authentication?
    active
  end

  def admin?
    role == 'admin'
  end

  def email_required?
    false
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(phone) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions.to_h).first
    end
  end
end
