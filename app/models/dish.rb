class Dish < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :title, :description
	validates_numericality_of :pax, only_integer: true
	validates_numericality_of :cost, greater_than: 0
	scope :search, -> (key_word) { where("lower(title) LIKE ? OR lower(description) LIKE ?", "%#{key_word.downcase}%", "%#{key_word.downcase}%") if key_word }
end