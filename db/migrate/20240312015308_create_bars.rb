class CreateBars < ActiveRecord::Migration[7.0]
  def change
    create_table :bars do |t|
      t.string :name
      t.boolean :minimum_age
      t.integer :rating

      t.timestamps
    end
  end
end
