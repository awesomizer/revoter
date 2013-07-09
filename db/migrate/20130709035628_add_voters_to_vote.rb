class AddVotersToVote < ActiveRecord::Migration
  def change
    add_column :votes, :voters, :text
  end
end
