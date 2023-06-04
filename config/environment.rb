ENV["RACK_ENV"] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV["RACK_ENV"])

require_all 'app/models'

#retrieve all reviews for a given user using the reviews association method:

user = User.find(1)
reviews = user.reviews

#retrieve all products associated with a given user:
user = User.find(1)
products = user.products

# retrieve all reviews associated with a given product
product = Product.find(1)
reviews = product.reviews

#retrieve the associated User or Product instance for a given Review instance using the user and product methods, respectively:

review = Review.find(1)
user = review.user
product = review.product

# Assuming you have a Product instance with id 1 and a User instance with id 2
product = Product.find(1)
user = User.find(2)

# Call the leave_review method to create a new review
product.leave_review(user, 4, "This product is great!")

#call all the reviews of the product
product = Product.find(1)
product.print_all_reviews

# The average method returns a float representing the average value of the specified attribute across all records in the relation. In this case, we specify :star_rating as the attribute to average.
product = Product.find(1)
puts "Average rating for #{product.name}: #{product.average_rating}"

#review with the highest star rating
user = User.find(1)
favorite_product = user.favorite_product
puts "#{user.name}'s favorite product is #{favorite_product.name}"