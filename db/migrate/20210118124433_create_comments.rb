class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :book, null: false, foreign_key: true
      t.string :description
      t.string :first_name
      t.integer :score

      t.timestamps
    end
  end
end
