require 'rails_helper'
describe Pin do
	it "is valid with a title, a description" do
		pin = Pin.new(
			title: 'Aaron',
			description: 'Marfa jean shorts VHS farm-to-table forage, gluten-free chillwave affogato slow-carb. '
		)
		expect(pin).to be_valid
	end

	it "is invalid with without a title" do
		pin = Pin.new(title: nil)
		pin.valid?
		expect(pin.errors[:title]).to include("can't be blank")
	end

	it "is invalid with without a description" do
		pin = Pin.new(description: nil)
		pin.valid?
		expect(pin.errors[:description]).to include("can't be blank")
	end
end