class AddCoordinatesToBikes < ActiveRecord::Migration[7.1]
  def change
    add_column :bikes, :address, :string
    add_column :bikes, :latitude, :float
    add_column :bikes, :longitude, :float
  end
end
