class ChangeMercatoName < ActiveRecord::Migration[7.0]
  def change
    rename_column :teams, :Mercato, :mercato_running
  end
end
