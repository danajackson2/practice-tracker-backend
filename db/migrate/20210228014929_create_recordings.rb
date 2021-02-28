class CreateRecordings < ActiveRecord::Migration[6.1]
  def change
    create_table :recordings do |t|
      t.references :session, null: false, foreign_key: true

      t.timestamps
    end
  end
end
