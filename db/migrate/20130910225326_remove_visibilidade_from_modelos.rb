class RemoveVisibilidadeFromModelos < ActiveRecord::Migration
  def change
    remove_column :modelos, :visibilidade, :string
  end
end
