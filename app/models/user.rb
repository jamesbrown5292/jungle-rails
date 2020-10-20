class User < ActiveRecord::Base

  has_secure_password

  validates :name,   presence: true
  validates :password, :password_confirmation, presence: true, length: { minimum: 8 }
  validates :email, uniqueness: { case_sensitive: false }, presence: true

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
    puts user
    if user
      user.authenticate(password)
      return user
    else 
      return nil
    end

  end
end
