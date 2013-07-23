class AddStateIdToLegislator < ActiveRecord::Migration
  def change
    add_column :legislators, :state_id, :integer
  end
end
