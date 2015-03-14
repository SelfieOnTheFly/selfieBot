class AddFirstnameToUser < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string
  end
end
