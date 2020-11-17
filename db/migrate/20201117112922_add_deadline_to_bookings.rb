class AddDeadlineToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :deadline, :date
  end
end
