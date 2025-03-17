class RenameAttendingColumnToUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :attend, :is_attending
  end
end
