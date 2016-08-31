require 'rails_helper'
describe Pin do
	it "has a valid factory" do
		expect(build(:pin)).to be_valid 
	end

	it "is valid with a title, a description" do
		pin = build(:pin)
		expect(pin).to be_valid
	end

	it "is invalid with without a title" do
		pin = build(:pin, title: nil)
		pin.valid?
		expect(pin.errors[:title]).to include("can't be blank")
	end

	it "is invalid with without a description" do
		pin = build(:pin, description: nil)
		pin.valid?
		expect(pin.errors[:description]).to include("can't be blank")
	end
end