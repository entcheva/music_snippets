class CreateWishlists < ActiveRecord::Migration[5.0]
  def change
    create_table :wishlists do |t|
      t.string :artist
      t.string :title
      t.string :instrument
    end
  end
end
