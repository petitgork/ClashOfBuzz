class AddStatutToMatches < ActiveRecord::Migration[7.0]
  def change
    add_column :matches, :statut, :string, default: "Composition"
  end
end
