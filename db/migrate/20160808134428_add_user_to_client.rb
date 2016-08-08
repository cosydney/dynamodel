class AddUserToClient < ActiveRecord::Migration
  def change
    add_reference :clients, :user, index: true, foreign_key: true
  end
end
