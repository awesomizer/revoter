class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.column(:code, :string)
      t.column(:name, :string)
      t.column(:population, :integer)
      t.column(:pop_percent, :float)
      t.column(:one_vote_weight, :float)
      t.timestamps
    end
  end
end
