class CreateSxjoins < ActiveRecord::Migration[6.1]
  def change
    create_table :sxjoins do |t|
      t.references :session, null: false, foreign_key: true
      t.references :excerpt, null: false, foreign_key: true

      t.timestamps
    end
  end
end
