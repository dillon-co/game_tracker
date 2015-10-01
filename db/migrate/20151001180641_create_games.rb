class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|

      t.timestamps null: false
      t.text :title, null: false
      t.integer :in_stock, default: 1, null: false
      t.text :borrower, default: ""
      t.text :date_borrowed 
    end
  end
end
