class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :roll_id
      t.string :vote_type
      t.string :question
      t.string :required
      t.text :voter_ids
      t.string :result

      t.timestamps
    end
  end
end
