require "rails_helper"

RSpec.describe WishlistsController do
  describe "POST #create" do
    context "successfully creates new wishlist" do
      it "redirects to dashboard path" do
        user = create(:user)
        sign_in_as(user)

        post(
          :create,
          params: {
            wishlist: {
              artist: "Beach House",
              title: "Lazuli",
              instrument: "guitalele",
            },
          },
        )

        expect(response).to redirect_to dashboard_path
        expect(flash[:notice]).to eq "Wishlist item created! You rock."
      end

      it "creates new activity" do
        allow(Activity).to receive(:create!)

        user = create(:user)
        mock_wishlist = stub_relation(user, :wishlists)

        sign_in_as(user)
        post(
          :create,
          params: {
            wishlist: {
              artist: "Beach House",
              title: "Lazuli",
              instrument: "guitalele",
            },
          },
        )

        expect(Activity).to have_received(:create!).with(
          subject: mock_wishlist,
          user: user,
          status: "created",
        )
      end
    end

    context "fails to create new wishlist" do
      it "renders the new view" do
        user = create(:user)
        sign_in_as(user)

        post(
          :create,
          params: {
            wishlist: {
              artist: "Beach House",
              title: "",
              instrument: "",
            },
          },
        )

        expect(response).to render_template :new
        expect(response).to have_http_status(400)
      end
    end
  end

  describe "GET #edit" do
    context "wishlist does NOT belong to current user" do
      it "does NOT allow user to edit wishlist" do
        user = create(:user)
        wishlist = create(:wishlist)
        sign_in_as(user)

        expect {
          get :edit, params: { id: wishlist.id }
        }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end

  describe "PATCH #update" do
    context "successfully updates wishlist" do
      it "redirects to dashboard path" do
        user = create(:user)
        wishlist = create(:wishlist, user: user)
        sign_in_as(user)

        patch(
          :update,
          params: {
            id: wishlist.id,
            wishlist: {
              artist: "Beach House",
              title: "Lazuli",
              instrument: "piano",
            },
          },
        )

        expect(response).to redirect_to dashboard_path
        expect(flash[:notice]).to eq "Wishlist item updated successfully."
      end

      it "creates new activity" do
        allow(Activity).to receive(:create!)

        user = create(:user)
        wishlist = create(:wishlist, user: user)
        sign_in_as(user)

        patch(
          :update,
          params: {
            id: wishlist.id,
            wishlist: {
              artist: "Beach House",
              title: "Lazuli",
              instrument: "piano",
            },
          },
        )

        expect(Activity).to have_received(:create!).with(
          subject: wishlist,
          user: user,
          status: "updated",
        )
      end
    end

    context "fails to update wishlist" do
      it "renders the edit view" do
        user = create(:user)
        wishlist = create(:wishlist, user: user)
        sign_in_as(user)

        patch(
          :update,
          params: {
            id: wishlist.id,
            wishlist: {
              artist: "Beach House",
              title: "Lazuli",
              instrument: "",
            },
          },
        )

        expect(response).to render_template :edit
        expect(response).to have_http_status(400)
      end
    end
  end
end
