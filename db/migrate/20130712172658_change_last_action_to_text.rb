class ChangeLastActionToText < ActiveRecord::Migration
  def up
    change_column :bills, :last_action, :text
  end

  def down
  end
end
