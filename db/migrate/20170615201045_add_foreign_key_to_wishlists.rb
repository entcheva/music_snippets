class AddForeignKeyToWishlists < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :wishlists, :users
  end
end
