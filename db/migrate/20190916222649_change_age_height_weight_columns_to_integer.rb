class ChangeAgeHeightWeightColumnsToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :olympians, :age, 'integer USING CAST(age AS integer)'
    change_column :olympians, :height, 'integer USING CAST(height AS integer)'
    change_column :olympians, :weight, 'integer USING CAST(weight AS integer)'
  end
end
