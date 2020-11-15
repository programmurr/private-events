class RenameColumns < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, 'Event Name', :event_name
    rename_column :events, 'Event Date', :event_date
  end
end
