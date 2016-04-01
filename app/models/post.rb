class Post < ActiveRecord::Base

 
 has_attached_file :image, styles: {medium: "500x500"}
 validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	# When I delete the post it needs to delete in databse (post_tags) to avoid redundant data.
	has_many :comments, dependent: :destroy
	has_many :post_tags, dependent: :destroy
	has_many :tags, through: :post_tags
  belongs_to :administrator
  belongs_to :user

#I want to validate my posts so that the title & content field must be filed before submission.
  validates :title, presence: true
  validates :content, presence: true
  validates :publish, presence: true


  def self.matching_title_or_content search
  	where("title LIKE ? OR content LIKE ?", "%#{search}%", "%#{search}%")
  end

  def self.filter_by_tags param_tag
    includes(:tags).where(publish: true, tags: {name: param_tag}).order(id: :desc)
    
  end
end
