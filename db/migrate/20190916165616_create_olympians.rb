class CreateOlympians < ActiveRecord::Migration[5.2]
  def change
    create_table :olympians do |t|
      t.string :name
      t.string :sex
      t.string :age
      t.string :height
      t.string :weight
      t.string :team

      t.timestamps
    end
  end
end
