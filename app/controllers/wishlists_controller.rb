class WishlistsController < ApplicationController
  def new
    @wishlist = Wishlist.new
  end

  def create
    @wishlist = current_user.wishlists.new(wishlist_params)
    if @wishlist.save
      redirect_to dashboard_url, notice: "Success"
    else
      render :new
    end
  end

  private

  def wishlist_params
    params.require(:wishlist).permit(:artist, :title, :instrument)
  end
end
