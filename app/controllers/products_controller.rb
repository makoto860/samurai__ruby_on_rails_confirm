class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params.require(:product).permit(:name))
    if @product.save
      flash[:notice] = "製品を新規登録しました"  
      redirect_to :products
    else
      render "new"
    end
  end

  def show
    @product = Product.find(params[:id])
    @reservations = @product.reservations
    @reservation = @reservations.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(params.require(:product).permit(:name))
      flash[:notice] = "ユーザーIDが「#{@product.id}」の情報を更新しました"
      redirect_to :products
    else
      render "edit"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "製品を削除しました"
    redirect_to :products
  end

  def own
  end
end
