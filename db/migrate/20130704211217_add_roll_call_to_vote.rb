class AddRollCallToVote < ActiveRecord::Migration
  def change
    add_column :votes, :roll_call, :text
  end
end
