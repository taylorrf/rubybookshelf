require "rails_helper"

RSpec.describe ReviewsController, type: :controller do
  describe "#create" do
    context "when the review is valid" do
      it "redirects to the book path" do
        book = stub_book
        stub_review

        post :create, book_id: book.id, review: { body: "" }

        expect(response).to redirect_to book_path(book.id)
      end

      it "sets the flash notice" do
        book = stub_book
        stub_review

        post :create, book_id: book.id, review: { body: "" }

        expect(flash[:notice]).to eq(t("reviews.create.notice"))
      end
    end

    context "when the review is invalid" do
      it "redirects back to the book" do
        book = stub_book
        stub_review

        post :create, book_id: book.id, review: { body: "" }

        expect(response).to redirect_to book_path(book.id)
      end
    end
  end

  def stub_signed_in_user
    user = double(:user)
    allow(controller).to receive(:current_user).and_return(user)
  end

  def stub_book
    build_stubbed(:book).tap do |book|
      allow(Book).to receive(:find).and_return(book)
    end
  end

  def stub_review
    instance_double("Review", save: true).tap do |review|
      allow(Review).to receive(:new).and_return(review)
    end
  end
end
