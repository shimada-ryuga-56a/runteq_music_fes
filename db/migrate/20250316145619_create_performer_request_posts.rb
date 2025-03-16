class CreatePerformerRequestPosts < ActiveRecord::Migration[7.1]
  def change
    create_table :performer_request_posts do |t|
      t.integer :offer_or_request, null: false
      t.integer :user_id, null: false
      t.text :comment, null: false

      t.timestamps
    end
  end
end
