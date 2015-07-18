require 'rails_helper'

RSpec.describe DishesController, type: :controller do
	describe "#index" do
		context "list all dishes" do
			let!(:user) { FactoryGirl.create(:user, email: "lan@example.com") }
			
			let!(:created_dishes) { FactoryGirl.create_list(:dish, 2) }

			it "public user can list all dishes" do
				get :index
				expect(assigns(:dishes)).to eq (created_dishes)
			end
		end

		context "search for dishes" do
			context "search found" do
				let!(:pho_ga_dish) { FactoryGirl.create(:dish, title: "chicken noodle soup") }
				let!(:pho_bo_dish) { FactoryGirl.create(:dish, title: "Beef noodle soup", user: User.create(email: 'linh@example.com')) }
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

	context "Require authenticated" do
		let!(:user) { FactoryGirl.create(:user, email: "lan@example.com") }
		before { sign_in user }
		
		describe "#create" do
			context "Success" do
				let!(:dish_params) { FactoryGirl.attributes_for(:dish) }

				it "allows authenticated access" do
			    expect{ post :create, dish:  dish_params }.to change(Dish, :count).by 1
			  end
			end	

			context "Failed to create" do
				let!(:dish_params) { FactoryGirl.attributes_for(:dish, title: nil) }

				it "allows authenticated access" do
			    expect{ post :create, dish:  dish_params }.not_to change(Dish, :count)
			  end
			end	
		end

		describe "#update" do
			context "Update Successfully" do
				let!(:dish) { FactoryGirl.create(:dish) }

				it "should change to new values" do
					put :update, id: dish.id, dish: FactoryGirl.attributes_for(:dish, title: "Grilled Sweet Potato")
					dish.reload
					expect(dish.title).to eq "Grilled Sweet Potato"
				end
			end
		end
	end
end