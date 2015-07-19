class Dish < ActiveRecord::Base
	acts_as_votable
	acts_as_commentable
	belongs_to :user, inverse_of: :dishes

	validates_presence_of :title, :description
	validates_numericality_of :pax, only_integer: true
	validates_numericality_of :cost, greater_than: 0

	scope :approved, -> { where(approved: true) }
	scope :unapproved, -> { where(approved: false) }
	scope :published, -> { where(published: true) }
	scope :search_by_title, -> (keyword) { where("lower(title) LIKE ?", "%#{keyword.downcase}%") }
	scope :search_by_description, -> (keyword) { where("lower(description) LIKE ? ", "%#{keyword.downcase}%") }
end