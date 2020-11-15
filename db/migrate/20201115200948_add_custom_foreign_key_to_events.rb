class AddCustomForeignKeyToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :creator_id, :integer, index: true
    add_foreign_key :events, :users, column: :creator_id
  end
end
