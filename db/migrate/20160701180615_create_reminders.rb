class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.belongs_to :user,index: true
      t.belongs_to :slot,index: true
      t.timestamps
    end
  end
end
