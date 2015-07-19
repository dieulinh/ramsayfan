class DishesController < ApplicationController	
	before_action :authenticate_user!, except: [:show, :index]

	def index
		@dishes = Dish.published.approved
		@dishes = @dishes.search_by_title(search_params) | @dishes.search_by_description(search_params) if search_params.present?
	end

	def show
		@dish = Dish.find(dish_id)
		@comments = @dish.comments
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
			flash[:error] = "There is an error while creating dish"
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

	def get_unapproved_dish
		@dish = Dish.unapproved
	end

	def get_dishes
		@dishes = current_user.dishes
	end

	def publish
		@dish = Dish.find(dish_id)
		@dish.published = !@dish.published
		if @dish.save
			flash[:notice] = @dish.published ? "Publish Successfully" : "Unpublish Successfully"
			redirect_to dish_url(@dish)
		else
			flash[:danger] = "Fail to publish the dish"
		end
	end

	def upvote
		@dish = Dish.find(dish_id)
    @dish.upvote_by current_user
   	redirect_to :back
	end

	def downvote
		@dish = Dish.find(dish_id)
    @dish.downvote_by current_user
   	redirect_to :back
	end

	def add_new_comment
		@dish = Dish.find(params[:id])
		comment = @dish.comments.new(params[:comment].permit(:title, :comment, :user_id))
		comment.user_id = current_user.id
    @dish.comments << comment
    redirect_to action: :show, id: @dish

	end

	private
	
	def dish_params
		params.require(:dish).permit(:title, :description, :cost, :pax, :vegetarian, :published, :user_id)
	end

	def comment_params
		params.require(:comment).permit(:title, :comment, :dish_id)
	end

	def dish_id
		params.require(:id)
	end

	def search_params
		params[:search]
	end
end