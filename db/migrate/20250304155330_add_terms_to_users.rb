# frozen_string_literal: true

class AddTermsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :term, :integer
    add_column :users, :role, :integer
  end
end
