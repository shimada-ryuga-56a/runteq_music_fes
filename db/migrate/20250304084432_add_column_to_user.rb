class AddColumnToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :username, :string, null: false
    add_column :users, :mattermost_link, :string
    add_column :users, :portfolio_link, :string
    add_column :users, :x_id, :string
    add_column :users, :attend?, :boolean, default: false, null: false
  end
end
