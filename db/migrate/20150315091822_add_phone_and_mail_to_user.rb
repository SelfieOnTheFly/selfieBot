class AddPhoneAndMailToUser < ActiveRecord::Migration
  def change
    add_column :users, :phone, :string
    add_column :users, :mail, :string
  end
end
