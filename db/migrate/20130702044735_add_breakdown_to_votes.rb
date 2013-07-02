class AddBreakdownToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :breakdown, :text
  end
end
