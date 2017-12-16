class Product < ApplicationRecord
	has_many :comments
	has_many :orders #Added in 5.7 according to my sketch from 5.6
	validates :name, presence: true
	validates :description, presence: true
	#validates :image_url, presence: true
	validates :image_url, allow_blank: true, format: { with: %r{.(gif|jpg|png)\Z}i, message: 'must be a URL for GIF, JPG or PNG image.' }
	validates :colour, presence: true
	validates :price, presence: true
	def self.search(search_term)
		Product.where("name LIKE ?", "%#{search_term}%")
	end
	def highest_rating_comment
		comments.rating_desc.first
	end
	def average_rating
		comments.average(:rating).to_f
	end
end