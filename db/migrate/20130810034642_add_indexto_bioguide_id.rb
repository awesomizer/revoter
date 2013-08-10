class AddIndextoBioguideId < ActiveRecord::Migration
  
  def change
    add_index :legislators, :bioguide_id, unique: true
  end

end
