class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.string :medal
      t.references :olympian, foreign_key: true
      t.references :event, foreign_key: true
      t.references :olympic, foreign_key: true

      t.timestamps
    end
  end
end
