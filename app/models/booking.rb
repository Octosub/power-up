class Booking < ApplicationRecord
  self.table_name = "poweru_bookings"
  
  belongs_to :power, foreign_key: "poweru_power_id"
  belongs_to :user, foreign_key: "poweru_user_id"

  validates :start_date, presence: true
  validates :end_date, comparison: { greater_than: :start_date }, presence: true

  def pending?
    status == 'pending'
  end
end
