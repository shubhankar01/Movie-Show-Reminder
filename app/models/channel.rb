class Channel < ActiveRecord::Base
  has_many :slots
  has_many :movies, :through => :slots
  def self.currently_playing()
    current_time=Time.now.strftime("%I")
    current_time= current_time.to_i
    timeslot=current_time/3
    channel = Slot.joins(:channel,:movie).select("slots.id as slot_id,slots.timeslot as timeslot,channels.name as ch_name,channels.id as ch_id,channels.description as ch_desc,channels.chImage as ch_image,movies.id as mv_id,movies.description as mv_desc,movies.name as mv_name,movies.length as mv_length,movies.mvImage as mv_image").where("timeslot =?",timeslot)

    if channel
      return channel
    else
      1
    end
  end
   def self.give_content(id,timeslot)
     content = Slot.joins(:channel,:movie).select("slots.id as slot_id,slots.timeslot as timeslot,channels.name as ch_name,channels.id as ch_id,channels.description as ch_desc,channels.chImage as ch_image,movies.id as mv_id,movies.description as mv_desc,movies.name as mv_name,movies.length as mv_length,movies.mvImage as mv_image").where("channel_id =? and timeslot >?",id,timeslot)
   if content
      return content
    else
      1
    end
  end

  def self.give_reminder_for_user(user_id)
    reminder=Reminder.where("user_id=?",user_id)
    if reminder
      return reminder
    else
      1
    end
  end
end
