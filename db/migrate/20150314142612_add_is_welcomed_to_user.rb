class AddIsWelcomedToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_welcomed, :bool
  end
end
