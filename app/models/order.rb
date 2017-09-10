class Order < ActiveRecord::Base
#class Order <ApplicationRecord
	belongs_to :product
	belongs to :user
end