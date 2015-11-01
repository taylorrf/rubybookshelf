require "rails_helper"

RSpec.describe Author do
  it { should validate_presence_of(:name) }
end
