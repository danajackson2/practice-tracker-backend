class CreatePieces < ActiveRecord::Migration[6.1]
  def change
    create_table :pieces do |t|
      t.string :title
      t.string :composer
      t.date :year_composed
      t.string :composer_dates

      t.timestamps
    end
  end
end
