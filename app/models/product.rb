class Product < ActiveRecord::Base
    # Add this line to define the 'name' attribute
    
      attribute :name, :string
    
        has_many :reviews
        has_many :users, through: :reviews
        has_many :reviewers, through: :reviews, source: :user
    
        def reviews
          Review.where(product_id: self.id)
        end
    
    
        # The users method defined in the Product class is used to retrieve all User instances that have reviewed the current Product instance.
    
    # The method uses the joins method to construct a SQL query that fetches all the User records that are related to the current Product instance through the Review model. 
    # .where(reviews: { product_id: self.id }) - This code appends a WHERE clause to the SQL query generated in step 1, filtering the results to only include Review records that have a product_id attribute that matches the id attribute of the current Product instance
        def users
          User.joins(:reviews).where(reviews: { product_id: self.id })
        end
    
        def leave_review(user, star_rating, comment)
          #Review.create(user: user, product: self, star_rating: star_rating, comment: comment)
          Review.create(user: user, product: self, star_rating: star_rating, comment: comment)
        end
        def print_all_reviews
          reviews.each do |review|
          puts Review for {insert product name} by {insert user name}: {insert review star_rating}. {insert review comment}
        end
        def average_rating
          reviews.average(:star_rating)
        end
    
      end