# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Dish.create(title: "Grilled Chicken Wings with Seasoned Buffalo Sauce", description: 'a cheesecake with a difference from Gordon Ramsaya dessert recipe from Kim Woodward, Head Chef at York & Albany.',
	cost: 12.29, pax: 5)
Dish.create(title: "Lemon Butter Scallops with Brussels Sprouts and Bacon", description: ' Melt butter in a large skillet over medium to high heat. Season scallops with salt and pepper and add to skillet once hot. Squeeze lemon juice over the tops and cook for 2-3 minutes or until bottom is a nice golden brown. (2.) Flip them over and cook another 2-3 minutes or until thoroughly cooked. Press your finger down on one to tell if it’s done. It should feel like a lightly flexed bicep.. and yes.. I flexed my arm while I checked the scallops so it’s okay if you do too',
	cost: 8.25, pax: 2, vegetarian: true)
Dish.create(title: "Brussels Sprouts, Gordon Ramsay Style", description: "The word fritter usually conjures up something heavy and deep-fried, but these zucchini pancakes are as light and delicate as can be.",
	cost: 12.29, pax: 3, vegetarian: true)
Dish.create(title: "Asparagus salads", description: "the Italian sauce made from olive oil, basil, garlic, nuts and Parmesan cheese — but this has to be one of my favorites.",
	cost: 10.59, pax: 1)
Dish.create(title: "Roasted Garlic Guacamole", description: "this bright and spicy salsa combines vine-ripened tomatoes, onions, garlic, Serrano chiles, cilantro and fresh lime.",
	cost: 15.29, pax: 2)
Dish.create(title: "Meat from Dunkin' Donuts", description: "Traditional guacamole is made with raw onions, which are flavorful yet pungent. This version, made with roasted garlic, has all of the flavor of the traditional guacamole but none of the unpleasant aftertaste. It’s always a crowd-pleaser!",
	cost: 34.89, pax: 6)