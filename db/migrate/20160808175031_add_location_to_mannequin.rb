class AddLocationToMannequin < ActiveRecord::Migration
  def change
    add_column :mannequins, :location, :string
  end
end
