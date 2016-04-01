class Diarylog < ActiveRecord::Base
  belongs_to :user

#I want to validate my posts so that the title & content field must be filed before submission.
  validates :date, presence: true
  validates :time, presence: true
  validates :meal_type, presence: true
  validates :description, presence: true
  


  #Validates date can only be on ore before this date. 

 validates_date :date, :on_or_before => lambda { Date.current }

end