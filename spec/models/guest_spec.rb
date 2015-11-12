require_relative "../../app/models/guest"

RSpec.describe Guest, "#authenticate" do
  it "returns always returns false" do
    authenticate_guest = Guest.new.authenticate "random_passowrd"

    expect(authenticate_guest).to eq false
  end
end
