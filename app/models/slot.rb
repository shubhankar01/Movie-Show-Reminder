class Slot < ActiveRecord::Base
  belongs_to :channel
  belongs_to :movie
  has_many :reminders
  has_many :users, :through => :reminders
end
