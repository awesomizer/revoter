class AddVoteListToBill < ActiveRecord::Migration
  def change
    add_column :bills, :vote_list, :text
  end
end
