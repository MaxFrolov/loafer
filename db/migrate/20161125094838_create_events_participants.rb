class CreateEventsParticipants < ActiveRecord::Migration[5.0]
  def change
    create_table :events_participants do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :event, index: true, foreign_key: true
      t.timestamps
    end
  end
end
