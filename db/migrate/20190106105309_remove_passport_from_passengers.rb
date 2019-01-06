class RemovePassportFromPassengers < ActiveRecord::Migration[5.1]
  def change
  	remove_column :passengers, :passport_no
  end
end
