class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :official_title
      t.text :summary_short
      t.datetime :last_vote_at
      t.string :last_action
      t.text :nicknames
      t.text :urls

      t.timestamps
    end
  end
end
