class User < ActiveRecord::Base

  has_secure_password
  validates :name, :email, :password, :password_confirmation, presence: true

end