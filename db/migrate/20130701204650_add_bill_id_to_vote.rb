class AddBillIdToVote < ActiveRecord::Migration
  def change
    add_column :votes, :bill_id, :integer
  end
end
