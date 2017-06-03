class AddMvImageToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :mvImage, :string
  end
end
