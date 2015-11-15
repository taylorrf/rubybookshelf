require "rails_helper"

RSpec.describe Review do
  it { is_expected.to belong_to(:book) }
  it { is_expected.to belong_to(:reviewer).class_name("User") }
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to delegate_method(:email).to(:reviewer).with_prefix(true) }
end
