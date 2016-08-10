class AddPhoneToMannequins < ActiveRecord::Migration
  def change
    add_column :mannequins, :phone, :string
  end
end
