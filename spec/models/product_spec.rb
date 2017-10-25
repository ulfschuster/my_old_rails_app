require 'rails_helper'

describe Product do

	context "when product has comments" do
		let (:product) {Product.create!(name: "race motorcycle", description: "product_spec_test", colour: "grey", price: "12")}
		let (:user) {User.create!(first_name: "Ulf", last_name: "Schuster", email: "ulfschuster@gmail.com", password: "28111973")}
	

		before do
			product.comments.create!(rating: 1, user: user, body: "Awful motorcycle!")
			product.comments.create!(rating: 3, user: user, body: "Ok motorcycle!")
			product.comments.create!(rating: 5, user: user, body: "Great motorcycle!")
		end

		it "returns the average rating of all comments" do
			expect(@product.average_rating).to eq(3)
		end

		it "is not valid without a name" do
			expect(Product.new(description: "Nice motorbike")).not_to be_valid
		end

	end

end