class ChangeMinimumAgeToIntegerInBars < ActiveRecord::Migration[7.0]
  def up
    change_column :bars, :minimum_age, 'integer USING CAST(minimum_age AS integer)'
  end

  def down
    change_column :bars, :minimum_age, :boolean
  end
end
