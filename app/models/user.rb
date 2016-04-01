class User < ActiveRecord::Base

has_attached_file :image, styles: {medium: "300x300", thumb: "150x150#"}
 validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :notifications, as: :notifiable, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :messages, dependent: :destroy

#A user has many diarylogs
has_many :diarylogs
#I want to validate my posts so that the title & content field must be filed before submission.
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_format_of :first_name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/
  validates_format_of :last_name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/
end
