class CreateSejoins < ActiveRecord::Migration[6.1]
  def change
    create_table :sejoins do |t|
      t.references :session, null: false, foreign_key: true
      t.references :etude, null: false, foreign_key: true

      t.timestamps
    end
  end
end
