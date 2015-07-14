require 'rails_helper'

RSpec.describe DishesController, type: :controller do
	describe "#index" do
		context "list all dishes" do
			let!(:created_dishes) { FactoryGirl.create_list(:dish, 2) }

			it "public user can list all dishes" do
				get :index
				expect(assigns(:dishes)).to eq (created_dishes)
			end
		end

		context "search for dishes" do
			context "search by title" do
				let!(:pho_ga_dish) { FactoryGirl.create(:dish, title: "chicken noodle soup") }
				let!(:pho_bo_dish) { FactoryGirl.create(:dish, title: "Beef noodle soup") }
				let(:dishes) { assigns(:dishes) }
				let!(:search) { 'Chicken' }
				
				it "return the dish with the correct title" do
					get :index, search: search
					expect(dishes).to include(pho_ga_dish)
					expect(dishes).not_to include(pho_bo_dish)
				end
			end
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