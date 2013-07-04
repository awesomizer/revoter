class CreateLegislator < ActiveRecord::Migration
  def change
    create_table :legislators do |t|
      t.string :bioguide_id
      t.string :state
      t.string :title
      t.string :chamber
      t.string :state_rank
      t.datetime :term_start
      t.datetime :term_end
      t.string :first_name
      t.string :nickname
      t.string :last_name
      t.timestamps
    end
  end

  def down
  end
end
