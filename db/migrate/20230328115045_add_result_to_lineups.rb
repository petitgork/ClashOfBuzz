class AddResultToLineups < ActiveRecord::Migration[7.0]
  def change
    add_column :line_ups, :result, :integer
  end
end
