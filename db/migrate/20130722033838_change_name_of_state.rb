class ChangeNameOfState < ActiveRecord::Migration
  def up
    change_table :legislators do |t|
      t.rename(:state, :state_code)
    end
  end

  def down
  end
end
