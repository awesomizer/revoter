class AddIndexToLegislatorsVoters < ActiveRecord::Migration
  def change
    add_index(:legislators_votes, [:legislator_id, :vote_id], :unique => true)
  end
end
