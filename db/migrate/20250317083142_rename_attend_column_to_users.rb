# frozen_string_literal: true

class RenameAttendColumnToUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :attend?, :attend
  end
end
