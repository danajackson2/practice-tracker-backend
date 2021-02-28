class CreateExcerpts < ActiveRecord::Migration[6.1]
  def change
    create_table :excerpts do |t|
      t.string :work
      t.string :composer
      t.string :place

      t.timestamps
    end
  end
end
