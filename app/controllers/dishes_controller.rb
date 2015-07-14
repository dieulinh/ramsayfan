class DishesController < ApplicationController	
	def index
		@dishes = Dish.search(search_params)
	end

	def show
		@dish = Dish.find(dish_id)
	end

	private
	
	def dish_id
		params[:id]
	end

	def search_params
		params[:search]
	end
end