class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	
      t.string :name
      t.string :login
      t.string :paswd
      t.boolean :is_admin

    end
  end
end
