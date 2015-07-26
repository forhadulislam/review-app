class FrontController < ApplicationController

    layout 'front'
    
    before_filter :common_data
    
    def index
        @subCategories = SubCategory.limit(6)
        @featuredReviews = Review.limit(8)
    end
    
    def categories
        @slug = params[:categorySlug]
        @category = Category.find_by slug: @slug
        @subCategories = SubCategory.where("category_id = ?", @category.id)
    end
    
    def subCategories
    end
    
    def search
    end
    
    def reviewDetails
        @slug = params[:reviewSlug]
        @review = Review.find_by slug: @slug
    end
    
    def go
        @offerId = params[:id]
        @review = Review.find(@offerId)
        @url = @review.url
        redirect_to @url
    end
    
    def common_data
      @headerCategories = Category.limit(15)
      @headerSubCategories = SubCategory.limit(15)
      
      @footerCategories = Category.limit(6)
    end
end
