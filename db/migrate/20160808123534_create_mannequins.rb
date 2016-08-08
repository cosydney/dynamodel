class CreateMannequins < ActiveRecord::Migration
  def change
    create_table :mannequins do |t|
      t.integer :age
      t.string :category
      t.text :description
      t.integer :height
      t.integer :chest
      t.integer :waist
      t.string :hair_color
      t.string :eyes
      t.string :ethnicity

      t.timestamps null: false
    end
  end
end
