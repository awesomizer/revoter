class AddIndextoVoteRollId < ActiveRecord::Migration
  
  def change
    add_index :votes, :roll_id, unique: true
  end

end
