class AddNameToMannequins < ActiveRecord::Migration
  def change
    add_column :mannequins, :first_name, :string
    add_column :mannequins, :last_name, :string
  end
end
