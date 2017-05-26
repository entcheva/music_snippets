class ChangeSnippetsNameToTitle < ActiveRecord::Migration[5.0]
  def change
    rename_column :snippets, :name, :title
  end
end
