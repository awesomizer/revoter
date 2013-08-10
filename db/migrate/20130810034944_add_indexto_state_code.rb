class AddIndextoStateCode < ActiveRecord::Migration

  def change
    add_index :states, :code, unique: true
  end


end
