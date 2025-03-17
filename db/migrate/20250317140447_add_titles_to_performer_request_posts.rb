# frozen_string_literal: true

class AddTitlesToPerformerRequestPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :performer_request_posts, :title, :string, null: false, default: 'title'
  end
end
