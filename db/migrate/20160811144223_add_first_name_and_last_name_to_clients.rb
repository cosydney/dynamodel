class AddFirstNameAndLastNameToClients < ActiveRecord::Migration
  def change
    add_column :clients, :first_name, :string
    add_column :clients, :last_name, :string
  end
end
