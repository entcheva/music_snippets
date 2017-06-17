class WishlistsController < ApplicationController
  def new
    @wishlist = Wishlist.new
  end

  def create
    @wishlist = current_user.wishlists.new(wishlist_params)
    if @wishlist.save
      record_activity(subject: @wishlist)
      redirect_to dashboard_url, notice: "Wishlist item created! You rock."
    else
      render :new, status: 400
    end
  end

  def edit
    @wishlist = current_user.wishlists.find(params[:id])
  end

  def update
    @wishlist = current_user.wishlists.find(params[:id])
    if @wishlist.update(wishlist_params)
      record_activity(subject: @wishlist)
      redirect_to dashboard_url, notice: "Wishlist item updated successfully."
    else
      render :edit, status: 400
    end
  end

  private

  def wishlist_params
    params.require(:wishlist).permit(:artist, :title, :instrument)
  end
end
