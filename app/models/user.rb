class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :authentication_keys => [:login]

  # attribute for authenticating by either username or email
  attr_accessor :login

  # Allow username(s)
  validates :username,
  :presence => true,
  :uniqueness => {
    :case_sensitive => false
  }

  # regex
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  # Change the behavior of the login action to take either usernme or email
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_hash).first
    end
  end

end
