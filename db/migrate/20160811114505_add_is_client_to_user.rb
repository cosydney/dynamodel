class AddIsClientToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_client, :boolean, {default: false}
  end
end
