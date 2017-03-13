class AddSnippetsNotesDefault < ActiveRecord::Migration

  def change
    change_column :snippets, :notes, :string, default: ''
  end

end
