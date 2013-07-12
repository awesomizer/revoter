class ChangeOfficialTitleToText < ActiveRecord::Migration
  def up
    change_column :bills, :official_title, :text
  end

  def down
  end
end
