class User < ActiveRecord::Base
    #Add this line to define the 'name' attribute
    
    attribute :name, :string
  
      has_many :reviews
      has_many :products, through: :reviews
      has_many :reviewed_products, through: :reviews, source: :product
  
      def reviews
        Review.where(user_id: self.id)
      end
  
      def products
        Product.joins(:reviews).where(reviews: { user_id: self.id })
      end
  
      def favorite_product
        reviews.order(star_rating: :desc).first.product
      end
  
    end