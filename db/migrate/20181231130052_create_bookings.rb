class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :Flight, foreign_key: true

      t.timestamps
    end
  end
end
