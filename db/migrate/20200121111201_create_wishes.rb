class CreateWishes < ActiveRecord::Migration[5.2]
  def change
    create_table :wishes do |t|
      t.integer :month
      t.string :content
      t.integer :cost, null: false
      t.references :user ,foreign_key: true
      t.timestamps
    end
  end
end
