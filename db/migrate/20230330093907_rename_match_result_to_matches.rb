class RenameMatchResultToMatches < ActiveRecord::Migration[7.0]
  def change
    change_column :matches, :match_result, :integer, default: 0
  end
end
