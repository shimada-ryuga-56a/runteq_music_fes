class AddCommentToPlayableInstruments < ActiveRecord::Migration[7.1]
  def change
    add_column :playable_instruments, :comment, :text, null: false
  end
end
