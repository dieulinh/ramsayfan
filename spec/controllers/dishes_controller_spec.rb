require 'rails_helper'

RSpec.describe DishesController, type: :controller do
	describe "#index" do
		let!(:created_dishes) { FactoryGirl.create_list(:dish, 2) }
		
		it "public user can list all dishes" do
			get :index
			expect(assigns(:dishes)).to eq (created_dishes)
		end
	end

	describe "#show" do
		let!(:current_dish) { FactoryGirl.create(:dish) }
		it "public user can view a dish" do
			get :show, id: current_dish.id
			expect(assigns(:dish)).to eq current_dish
		end
	end
end