class RenameResultToLineups < ActiveRecord::Migration[7.0]
  def change
    change_column :line_ups, :result, :integer, default: 0
  end
end
