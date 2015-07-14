class Dish < ActiveRecord::Base
	validates_presence_of :title, :description
	validates_numericality_of :pax, only_integer: true
	validates_numericality_of :cost, greater_than: 0

end
