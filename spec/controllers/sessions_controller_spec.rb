require "rails_helper"

RSpec.describe SessionsController do
  describe "POST create" do
    it "redirects to root url on successful authentication" do
      stub_session_authentication method: :authenticate, return_value: true

      post :create, session: attributes_for(:user)

      expect(response).to redirect_to root_url
    end

    it "renders new on unsuccessful authentication" do
      stub_session_authentication method: :authenticate, return_value: false

      post :create, session: { email: "invalidemail", password: "somepassword" }

      expect(response).to render_template :new
    end
  end

  def stub_session_authentication(method:, return_value:)
    build_stubbed(:user).tap do |stubbed_user|
      allow(User).to receive(:lookup_for_authentication_with).
        and_return stubbed_user
      allow(stubbed_user).to receive(method).and_return(return_value)
    end
  end
end
