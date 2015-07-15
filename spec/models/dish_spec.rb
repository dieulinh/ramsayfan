require 'rails_helper'

RSpec.describe Dish, type: :model do
	describe "It should have valid data as a dish" do
		let!(:dish) { FactoryGirl.create(:dish) }
		
		it { should validate_presence_of :title }
		it { should validate_presence_of :description }
		it { should validate_numericality_of(:cost).is_greater_than(0) } 
		it { should validate_numericality_of(:pax).only_integer }
	end
end