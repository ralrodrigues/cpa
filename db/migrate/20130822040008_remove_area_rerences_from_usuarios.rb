class RemoveAreaRerencesFromUsuarios < ActiveRecord::Migration
  def change
    remove_reference :usuarios, :area, index: true
  end
end
