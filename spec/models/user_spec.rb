require "rails_helper"

RSpec.describe User, "validations" do
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to allow_value("validemail@domain.com").for(:email) }
  it { is_expected.not_to allow_value("nope@com").for(:email) }
end

RSpec.describe User, ".lookup_for_authentication_with" do
  it "retrieves a user based on the passed in identifier" do
    user = create :user, email: "already_registered@example.com"

    retrieved_user = User.lookup_for_authentication_with identifier: user.email

    expect(retrieved_user).to eq user
  end

  it "returns a Guest if no user is found based on the identifier" do
    non_existent_email = "not_here@example.com"

    retrieved_user =
      User.lookup_for_authentication_with identifier: non_existent_email

    expect(retrieved_user).to be_a Guest
  end
end
