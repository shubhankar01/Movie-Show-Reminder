class Reminder < ActiveRecord::Base
   belongs_to :user
   belongs_to :slot
   
end
  
