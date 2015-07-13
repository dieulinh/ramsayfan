require 'rails_helper'

RSpec.describe DishesController, type: :controller do
	describe "#index" do
		let!(:created_dishes) { FactoryGirl.create_list(:dish, 2) }
		
		it "public user can list all dishes" do
			get :index
			expect(assigns(:dishes)).to eq (created_dishes)
		end
	end
end