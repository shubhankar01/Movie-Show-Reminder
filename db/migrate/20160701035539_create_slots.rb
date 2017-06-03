class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
      t.integer :timeslot
      t.belongs_to :channel,index: true
      t.belongs_to :movie,index: true
      t.timestamps
    end
  end
end
