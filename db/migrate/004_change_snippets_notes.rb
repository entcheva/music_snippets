class ChangeSnippetsNotes < ActiveRecord::Migration

  def change
    change_column :snippets, :notes, :string
  end

end
