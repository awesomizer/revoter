class AddPartyToLegislators < ActiveRecord::Migration
  def change
    add_column :legislators, :party, :string
  end
end
