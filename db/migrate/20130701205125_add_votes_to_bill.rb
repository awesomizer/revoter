class AddVotesToBill < ActiveRecord::Migration
  def change
    add_column :bills, :votes, :text
  end
end
