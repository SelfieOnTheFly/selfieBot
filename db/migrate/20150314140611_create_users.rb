class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :tw_id
      t.string :tw_handle

      t.timestamps null: false
    end
  end
end
