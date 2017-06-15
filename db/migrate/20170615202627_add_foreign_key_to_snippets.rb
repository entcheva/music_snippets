class AddForeignKeyToSnippets < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :snippets, :users
  end
end
