class RemoveVoterIdsFromVotes < ActiveRecord::Migration
  def up
    remove_column :votes, :voter_ids
  end

  def down
    add_column :votes, :voter_ids, :string
  end
end
