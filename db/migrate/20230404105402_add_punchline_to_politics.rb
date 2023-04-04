class AddPunchlineToPolitics < ActiveRecord::Migration[7.0]
  def change
    add_column :politics, :punch_line, :string
  end
end
