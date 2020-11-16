class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.references :attendee, foreign_key: { to_table: :users }
      t.references :created_event, foreign_key: { to_table: :events }
      t.timestamps
    end
  end
end
