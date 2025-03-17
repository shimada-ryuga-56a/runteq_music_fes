class ChangePerformerRequestPostsColumnDefault < ActiveRecord::Migration[7.1]
  def change
    change_column_default :performer_request_posts, :title, from: "title", to: nil
  end
end
