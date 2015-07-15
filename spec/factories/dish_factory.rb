FactoryGirl.define do
	factory :dish do
		title 'Traditional Dish'
		description 'This is a traditional dish'
		cost 12.34
		pax 5
		vegetarian false
		user
	end
end