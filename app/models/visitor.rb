#When we delete visitor , make sure it deletes all their comments
class Visitor < ActiveRecord::Base
	has_many :notifications, as: :notifiable, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :messages, dependent: :destroy

end
