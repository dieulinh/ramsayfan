class DishesController < ApplicationController	
	before_action :authenticate_user!, except: [:show, :index]

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
		if @dish.save
			flash[:notice] = "Successful creating"
			redirect_to dish_url(@dish)
		else
			flash[:error] = "There is an errors while creating dish"
			render :new
		end
	end

	def update
		@dish = Dish.find(dish_id)
		if @dish.update(dish_params)
			flash[:notice] = "Successful updated"
			redirect_to dish_url(@dish)
		else
			flash[:error] = "Failed to update"
			render :new
		end
	end

	def edit
		@dish = Dish.find(dish_id)
		render :new
	end

	def get_dishes
		@dishes = current_user.dishes
	end

	def publish
		@dish = Dish.find(dish_id)
		published = @dish.published =!@dish.published
		if @dish.save
			(published ? flash[:notice] = "Publish Successfully" : flash[:notice] = "Unpublish Successfully")
			redirect_to dish_url(@dish)
		else
			flash[:error] = "Fail to publish the dish"
		end
	end

	private
	
	def dish_params
		params.require(:dish).permit(:title, :description, :cost, :pax, :vegetarian, :published, :user_id)
	end

	def dish_id
		params[:id]
	end

	def search_params
		params[:search]
	end
end