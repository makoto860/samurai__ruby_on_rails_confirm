class ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations.all
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    @reservation = Reservation.find_by(params[:product_id])
    @user = current_user
  end

  def create
    product = Product.find(params[:product_id])
    reservation = product.reservations_new
    reservation.save_reservation(reservation, reservation_params)
    redirect_to :confirm_reservations
  end

  private
    def reservation_params
      params.require(:reservation).permit(:quantity, :product_id, :user_id)
    end
end
