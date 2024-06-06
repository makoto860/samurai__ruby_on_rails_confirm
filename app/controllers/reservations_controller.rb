class ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations.all
  end

  def comfirm
    @reservation = Reservation.new(params.permit(:quantity, :product_id, :user_id))
    @reservation = Reservation.find(params[:product_id])
    
    @user = User.find(current_user.id)
    @user_id = current_user.id
  end

  def new
  end

  def create
    product = Product.find(params[:product_id])
    reservation = product.reservations_new
    reservation.save_reservation(reservation, reservation_params)
    redirect_to :reservations_comfirm
  end

  def show
  end

  def edit
  end

  private
    def reservation_params
      params.require(:reservation).permit(:quantity).
             merge(user_id: current_user.id, product_id: params[:product_id])
    end
end
