class AddPhotoToTournaments < ActiveRecord::Migration[7.0]
  def change
    add_column :tournaments, :photo, :string
  end
end
