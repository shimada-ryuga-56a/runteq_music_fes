class CreatePlayableInstruments < ActiveRecord::Migration[7.1]
  def change
    create_table :playable_instruments do |t|
      t.string :instrument_name, null: false
      t.integer :user_id, null: false
      t.boolean :hope_for_matching?, null: false, default: true

      t.timestamps
    end
  end
end
