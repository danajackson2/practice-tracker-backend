class CreateSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :sessions do |t|
      t.date :date
      t.integer :duration
      t.integer :focus_rating
      t.integer :prod_rating
      t.text :notes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
