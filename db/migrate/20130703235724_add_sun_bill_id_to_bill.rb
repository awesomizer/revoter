class AddSunBillIdToBill < ActiveRecord::Migration
  def change
    add_column :bills, :sun_bill_id, :string
  end
end
