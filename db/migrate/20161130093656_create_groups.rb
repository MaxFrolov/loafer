class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :title
      t.boolean :default, default: false
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
