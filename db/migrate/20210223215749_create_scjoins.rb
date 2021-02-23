class CreateScjoins < ActiveRecord::Migration[6.1]
  def change
    create_table :scjoins do |t|
      t.references :session, null: false, foreign_key: true
      t.references :scale, null: false, foreign_key: true

      t.timestamps
    end
  end
end
