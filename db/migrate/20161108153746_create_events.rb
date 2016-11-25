class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :subtitle
      t.string :address
      t.float :lng
      t.float :lat
      t.integer :members_count
      t.integer :status
      t.boolean :private, default: false
      t.timestamp :start_date
      t.timestamp :approximate_time
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
