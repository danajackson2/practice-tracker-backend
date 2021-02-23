class CreateLongtones < ActiveRecord::Migration[6.1]
  def change
    create_table :longtones do |t|
      t.string :note

      t.timestamps
    end
  end
end
