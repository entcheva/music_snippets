class CreateSnippets < ActiveRecord::Migration

  def change
    create_table :snippets do |t|
      t.string :name
      t.string :artist
      t.text :notes, array: true, default: []
      t.integer :user_id
    end
  end

end
