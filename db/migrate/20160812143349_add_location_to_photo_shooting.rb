class AddLocationToPhotoShooting < ActiveRecord::Migration
  def change
    add_column :photo_shootings, :address, :string
    add_column :photo_shootings, :zip_code, :string
    add_column :photo_shootings, :city, :string
    add_column :photo_shootings, :country, :string
  end
end
