class AddGenderToMannequins < ActiveRecord::Migration
  def change
    add_column :mannequins, :gender, :string
  end
end
