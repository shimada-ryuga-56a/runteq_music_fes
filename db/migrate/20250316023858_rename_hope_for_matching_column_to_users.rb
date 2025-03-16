class RenameHopeForMatchingColumnToUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :playable_instruments, :hope_for_matching?, :hope_for_matching
  end
end
