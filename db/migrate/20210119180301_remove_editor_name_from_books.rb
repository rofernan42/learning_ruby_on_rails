class RemoveEditorNameFromBooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :editor_name, :string
  end
end
