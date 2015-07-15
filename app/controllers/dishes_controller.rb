class DishesController < ApplicationController	
	before_action :authenticate_user!, :except => [:show, :index]

	def index
		@dishes = Dish.search(search_params)
	end

	def show
		@dish = Dish.find(dish_id)
	end

	def new
		@dish = Dish.new
	end

	def create
		@dish = Dish.new(dish_params)
		@dish.user = current_user if current_user
		if @dish.save
			flash[:notice] = "Successful creating"
			redirect_to root_url
		else
			flash[:errors] = "There is an errors while creating dish"
			render :new
		end
	end

	private
	
	def dish_params
		params.require(:dish).permit(:title, :description, :cost, :pax, :vegetarian, :user_id)
	end

	def dish_id
		params[:id]
	end

	def search_params
		params[:search]
	end
end