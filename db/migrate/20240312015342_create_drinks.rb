class CreateDrinks < ActiveRecord::Migration[7.0]
  def change
    create_table :drinks do |t|
      t.string :name
      t.integer :proof
      t.boolean :made_in_mexico
      t.references :bar, null: false, foreign_key: true

      t.timestamps
    end
  end
end
