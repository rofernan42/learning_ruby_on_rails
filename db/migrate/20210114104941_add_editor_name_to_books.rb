class AddEditorNameToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :editor_name, :string
  end
end
