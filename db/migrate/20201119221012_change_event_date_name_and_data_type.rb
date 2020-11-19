class ChangeEventDateNameAndDataType < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :date, :date
    remove_column :events, :event_date
  end
end
