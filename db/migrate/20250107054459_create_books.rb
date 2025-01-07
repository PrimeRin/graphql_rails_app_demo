class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :sl_no
      t.integer :publish_year
      t.decimal :price

      t.timestamps
    end
  end
end
