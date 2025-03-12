class CreatePlayableInstruments < ActiveRecord::Migration[7.1]
  def change
    create_table :playable_instruments do |t|
      t.string :instrument_name
      t.integer :user_id
      t.boolean :hope_for_matching?

      t.timestamps
    end
  end
end
