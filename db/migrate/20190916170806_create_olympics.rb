class CreateOlympics < ActiveRecord::Migration[5.2]
  def change
    create_table :olympics do |t|
      t.string :games

      t.timestamps
    end
  end
end
