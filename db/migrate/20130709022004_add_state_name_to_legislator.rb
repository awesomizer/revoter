class AddStateNameToLegislator < ActiveRecord::Migration
  def change
    add_column :legislators, :state_name, :string
  end
end
