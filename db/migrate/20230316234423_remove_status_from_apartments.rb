class RemoveStatusFromApartments < ActiveRecord::Migration[6.0]
  def change
    remove_column :apartments, :status

  end
end
