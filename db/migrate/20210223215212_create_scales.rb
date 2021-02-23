class CreateScales < ActiveRecord::Migration[6.1]
  def change
    create_table :scales do |t|
      t.string :note
      t.string :quality

      t.timestamps
    end
  end
end
