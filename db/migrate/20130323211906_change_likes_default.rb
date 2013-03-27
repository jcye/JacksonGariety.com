class ChangeLikesDefault < ActiveRecord::Migration
  def change
    change_column_default(:posts, :likes, 0)
  end
end
