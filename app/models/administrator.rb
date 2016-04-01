class Administrator < ActiveRecord::Base
	has_secure_password

	has_many :posts

	validates :fullname, presence: true
	validates :username, presence: true, format: {with: /@/, message: 'is not a valid. Please enter a valid email address.'}
	validates :password, presence: true
end
