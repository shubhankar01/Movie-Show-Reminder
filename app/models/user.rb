class User < ActiveRecord::Base 
  attr_accessor :password
  before_save :encrypt_password
  has_many :reminders
  has_many :slots, :through => :reminders
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def self.get_channel_movie_data
    maildata = Slot.joins(:channel,:movie).select("slots.id as slot_id,slots.timeslot as timeslot,channels.name as ch_name,movies.name as mv_name")
  if maildata
      return maildata
    else
      1
    end
  end

  def self.get_user_slot_data
    userdata = Reminder.joins(:user,:slot).select("slots.id as slot_id,users.email as user_email")
  if userdata
      return userdata
    else
      1
    end
  end
end
