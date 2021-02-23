class CreateSljoins < ActiveRecord::Migration[6.1]
  def change
    create_table :sljoins do |t|
      t.references :session, null: false, foreign_key: true
      t.references :longtone, null: false, foreign_key: true

      t.timestamps
    end
  end
end
