class RemoveHopeFromPlayableInstruments < ActiveRecord::Migration[7.1]
  def change
    remove_column :playable_instruments, :hope_for_matching, :boolean
  end
end
