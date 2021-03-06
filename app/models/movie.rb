class Movie < ActiveRecord::Base
  has_many :slots
  has_many :channels, :through => :slots

  def self.search(search)
    result= Slot.joins(:channel,:movie).select("slots.timeslot as timeslot,channels.name as ch_name,channels.id as ch_id,channels.description as ch_desc,channels.chImage as ch_image,movies.id as mv_id,movies.description as mv_desc,movies.name as mv_name,movies.length as mv_length,movies.mvImage as mv_image").where("movies.name =?",search)

    if result
      return result
    else
      1
    end
  end
  def self.get_movie(id)
    result= Slot.joins(:channel,:movie).select("slots.timeslot as timeslot,channels.name as ch_name,channels.id as ch_id,channels.description as ch_desc,channels.chImage as ch_image,movies.id as mv_id,movies.description as mv_desc,movies.name as mv_name,movies.length as mv_length,movies.mvImage as mv_image").where("movies.id=?",id)

    if result
      return result
    else
      1
    end
  end
end
