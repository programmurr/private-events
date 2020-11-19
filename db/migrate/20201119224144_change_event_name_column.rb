class ChangeEventNameColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :event_name, :name
  end
end
