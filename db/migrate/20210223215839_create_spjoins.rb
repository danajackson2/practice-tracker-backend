class CreateSpjoins < ActiveRecord::Migration[6.1]
  def change
    create_table :spjoins do |t|
      t.references :session, null: false, foreign_key: true
      t.references :piece, null: false, foreign_key: true

      t.timestamps
    end
  end
end
