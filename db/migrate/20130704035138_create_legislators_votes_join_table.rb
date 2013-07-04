class CreateLegislatorsVotesJoinTable < ActiveRecord::Migration
  def change
    create_table(:legislators_votes, id: false) do |t|
      t.integer :legislator_id
      t.integer :vote_id
    end
  end
end
