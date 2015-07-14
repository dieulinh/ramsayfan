class Dish < ActiveRecord::Base
	validates :title, presence: true
	validates_numericality_of :pax, only_integer: true
	validates_numericality_of :cost, greater_than: 0

end
