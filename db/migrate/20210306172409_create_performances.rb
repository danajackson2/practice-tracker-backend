class CreatePerformances < ActiveRecord::Migration[6.1]
  def change
    create_table :performances do |t|
      t.string :date
      t.string :composer
      t.string :piece
      t.string :event
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
