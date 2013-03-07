class ChangeThumbToEventType < ActiveRecord::Migration
  def change
    remove_column :events, :thumb
    add_column :events, :event_type, :integer
  end
end
