class AddHipsToMannequin < ActiveRecord::Migration
  def change
    add_column :mannequins, :hips, :integer
  end
end
