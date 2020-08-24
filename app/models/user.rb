class User < ActiveRecord::Base

has_secure_password

validates :first_name, presence: true
validates :last_name, presence: true
validates :email, presence: true
validates_uniqueness_of :email, case_sensitive: false
validates :password, length: {minimum: 4}, presence: true
validates :password_confirmation, presence: true

end
