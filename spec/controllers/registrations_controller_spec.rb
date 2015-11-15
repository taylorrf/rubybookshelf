require "rails_helper"

RSpec.describe RegistrationsController do
  describe "POST create" do
    it "redirects to root path if registration succeeds" do
      stub_user_creation_with method: :save, return_value: true

      post :create, registration: attributes_for(:user)

      expect(response).to redirect_to root_url
    end

    it "renders new if registration fails" do
      stub_user_creation_with method: :save, return_value: false

      post :create, registration: { email: "" }

      expect(response).to render_template :new
    end

    it "signs the user in" do
      user = stub_user_creation_with method: :save, return_value: true

      post :create, registration: { email: "" }

      expect(session[:user_id]).to eq(user.id)
    end
  end

  def stub_user_creation_with(method:, return_value:)
    build_stubbed(:user).tap do |stubbed_user|
      allow(User).to receive(:new).and_return stubbed_user
      allow(stubbed_user).to receive(method).and_return return_value
    end
  end
end
