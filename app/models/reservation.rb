class Reservation < ApplicationRecord
  belongs_to :product
  belongs_to :user

  def save_reservation(reservation, reservation_params)
    reservation.quantity = reservation_params[:quantity]
    reservation.user_id = reservation_params[:user_id]
    reservation.product_id = reservation_params[:product_id]
    save
  end
end
