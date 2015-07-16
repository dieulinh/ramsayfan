class Dish < ActiveRecord::Base
	belongs_to :user, inverse_of: :dishes
	validates_presence_of :title, :description
	validates_numericality_of :pax, only_integer: true
	validates_numericality_of :cost, greater_than: 0
	
	def self.search(key_word)
		if key_word.present? 
			where(published: true).where(approved: true).where("lower(title) LIKE ? OR lower(description) LIKE ?", "%#{key_word.downcase}%", "%#{key_word.downcase}%").order(created_at: :desc)
		else
			where(published: true).where(approved: true).order(created_at: :desc)
		end
	end
	scope :published, -> { where(published: true).order(created_at: :desc)}
end