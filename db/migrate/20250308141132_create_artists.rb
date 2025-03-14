# frozen_string_literal: true

class CreateArtists < ActiveRecord::Migration[7.1]
  def change
    create_table :artists do |t|
      t.string :name, null: false
      t.integer :performance_category, null: false
      t.integer :requested_play_time, null: false
      t.text :performance_content

      t.timestamps
    end
  end
end
