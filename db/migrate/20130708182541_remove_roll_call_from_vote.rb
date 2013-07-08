class RemoveRollCallFromVote < ActiveRecord::Migration
  def up
    remove_column :votes, :roll_call
  end

  def down
    add_column :votes, :roll_call, :text
  end
end
