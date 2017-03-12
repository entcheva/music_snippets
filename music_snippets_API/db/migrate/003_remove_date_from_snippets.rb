class RemoveDateFromSnippets < ActiveRecord::Migration

  def change
    remove_column :snippets, :date
  end
  
end
