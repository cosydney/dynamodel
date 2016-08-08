class AddUserToMannequin < ActiveRecord::Migration
  def change
    add_reference :mannequins, :user, index: true, foreign_key: true
  end
end
