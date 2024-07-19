require 'rails_helper'

RSpec.describe Category, type: :model do
  it "is valid with a name and user" do
    user = FactoryBot.create(:user)
    category = FactoryBot.build(:category, name: "Example Category", user: user)
    expect(category).to be_valid
  end

  it "is not valid without a name" do
    category = FactoryBot.build(:category, name: nil)
    expect(category).to_not be_valid
  end

  it "is not valid without a user" do
    category = FactoryBot.build(:category, user: nil)
    expect(category).to_not be_valid
  end

  it "has many products" do
    assoc = described_class.reflect_on_association(:p)
    expect(assoc.macro).to eq :has_many
  end

  it "belongs to a user" do
    assoc = described_class.reflect_on_association(:user)
    expect(assoc.macro).to eq :belongs_to
  end
end
