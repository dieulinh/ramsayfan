class DishesController < ApplicationController	
	before_action :authenticate_user!, except: [:show, :index, :get_dishes]

	def index
		@dishes = Dish.search(search_params)
	end

	def show
		@dish = Dish.find(dish_id)
	end

	def new
		@dish = current_user.dishes.build
	end

	def create
		@dish = current_user.dishes.build(dish_params)
		# @dish.user = current_user if current_user
		if @dish.save
			flash[:notice] = "Successful creating"
			redirect_to root_url
		else
			flash[:error] = "There is an errors while creating dish"
			render :new
		end
	end

	def update
		@dish = Dish.find(dish_id)
		if @dish.update(dish_params)
			flash[:notice] = "Successful updated"
			redirect_to root_url
		else
			flash[:error] = "Failed to update"
			render :new
		end
	end

	def edit
		@dish = current_user.dishes.find(dish_id)
		render :new
	end

	def get_dishes
		@dishes = current_user.dishes
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