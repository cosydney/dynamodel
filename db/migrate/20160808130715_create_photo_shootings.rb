class CreatePhotoShootings < ActiveRecord::Migration
  def change
    create_table :photo_shootings do |t|
      t.datetime :date
      t.integer :budget
      t.text :description
      t.references :mannequin, index: true, foreign_key: true
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
