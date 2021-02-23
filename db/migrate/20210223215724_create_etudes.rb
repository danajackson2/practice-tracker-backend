class CreateEtudes < ActiveRecord::Migration[6.1]
  def change
    create_table :etudes do |t|
      t.string :book
      t.integer :number
      t.string :composer

      t.timestamps
    end
  end
end
