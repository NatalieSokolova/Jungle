class User < ActiveRecord::Base

has_secure_password

validates :first_name, presence: true
validates :last_name, presence: true
validates :email, uniqueness: { case_sensitive: false }, presence: true
validates :password, length: { minimum: 4 }, presence: true
validates :password_confirmation, presence: true

def self.authenticate_with_credentials(email, password)
  puts "Email: #{ email }"
  puts "Password: #{ password }"
  
  user = User.find_by_email(email.downcase.strip)

  puts "User: #{ user }"

  user && user.authenticate(password) ? user : nil
end

end
