class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|

      t.string :title
      t.datetime :news_date
      t.text :short_text
      t.text :full_text

      t.references :user
      t.references :categories 
      
    end
  end
end
