class AddChImageToChannels < ActiveRecord::Migration
  def change
    add_column :channels, :chImage, :string
  end
end
