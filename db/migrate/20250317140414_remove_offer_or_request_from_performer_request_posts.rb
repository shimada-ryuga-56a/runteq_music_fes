class RemoveOfferOrRequestFromPerformerRequestPosts < ActiveRecord::Migration[7.1]
  def change
    remove_column :performer_request_posts, :offer_or_request, :integer
  end
end
