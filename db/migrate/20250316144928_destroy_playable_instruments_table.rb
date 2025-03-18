# frozen_string_literal: true

class DestroyPlayableInstrumentsTable < ActiveRecord::Migration[7.1]
  def change
    drop_table :playable_instruments
  end
end
