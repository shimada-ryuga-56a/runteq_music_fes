class CreateArtistMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :artist_members do |t|
      t.integer :artist_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
