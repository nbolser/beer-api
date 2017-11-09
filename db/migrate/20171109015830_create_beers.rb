class CreateBeers < ActiveRecord::Migration[5.0]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :style
      t.string :yeast
      t.string :hop
      t.string :malts
      t.string :ibu
      t.string :alcohol
      t.string :blg

      t.timestamps
    end
  end
end
