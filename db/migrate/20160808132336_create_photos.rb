class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :mannequin, index: true, foreign_key: true
      t.string :profile_picture
      t.string :polaroid
      t.string :portofolio

      t.timestamps null: false
    end
  end
end
