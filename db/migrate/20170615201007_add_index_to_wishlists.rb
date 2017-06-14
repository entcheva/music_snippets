class AddIndexToWishlists < ActiveRecord::Migration[5.0]
  def change
    add_index :wishlists, :user_id
  end
end
