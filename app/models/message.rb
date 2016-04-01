class Message < ActiveRecord::Base
validates :content, presence: true
validates :subject, presence: true


belongs_to :visitor
belongs_to :user
  def self.matching_fullname_or_content params
  	joins(:visitor).where("fullname LIKE ? OR content LIKE ?", "%#{params}%", "%#{params}%")
	end

def mark_read
	update(status: true)if status == false
end
end



