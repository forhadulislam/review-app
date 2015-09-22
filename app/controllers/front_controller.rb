class FrontController < ApplicationController

    layout 'front'
    
    before_filter :common_data
    
    def index
        @title = "Current title"
        @home = 1
        
        @subCategories = SubCategory.limit(6)
        @featuredReviews = Review.where("is_featured == ? AND is_published = ?", "yes", "yes").limit(8)
        
        @topProducts = Review.where("is_published = ?", "yes").order(score: :desc).limit(6)
        @latestReviews = Review.where("is_published = ?", "yes").order(created_at: :desc).limit(6)
    end
    
    def categories
        @slug = params[:categorySlug]
        @category = Category.find_by slug: @slug
        @subCategories = SubCategory.where("category_id = ?", @category.id)
        @subtitle = @category.title
        @description = @category.description
        
        Category.increment_counter(:total_viewed, @category.id)
        
        @image = @category.image
    end
    
    def subCategories
        @catSlug = params[:categorySlug]
        @subCatSlug = params[:subCategorySlug]
        @category = Category.find_by slug: @catSlug
        @subCategory = SubCategory.find_by slug: @subCatSlug
        @subtitle = @subCategory.title
        @description = @subCategory.description
        
        SubCategory.increment_counter(:total_viewed, @subCategory.id)
        
        @reviews = Review.where("sub_category_id = ? AND is_published = ?", @subCategory.id, "yes").order(score: :desc)
        
        @image = @subCategory.image
    end
    
    def search
        @query = query = params[:q]
        if !@query
            redirect_to root_url
        end
        @reviews = Review.where("(title LIKE ? OR short_description LIKE ?) AND is_published = ?", "%#{query}%", "%#{query}%", "yes").limit(50)
    end
    
    def reviewDetails
        @slug = params[:reviewSlug]
        begin
            @review = Review.where("is_published = ?", "yes").find_by slug: @slug
            @subtitle = @review.title
            @description = @review.short_description
        rescue
            raise ActionController::RoutingError.new('Not Found')
        end
        
        Review.increment_counter(:total_viewed, @review.id)
        
        @recommendedReviews = Review.where("id != ? AND sub_category_id = ? AND is_published = ?", @review.id, @review.sub_category_id, "yes").limit(8)
    end
    
    def go
        @offerId = params[:id]
        @review = Review.find(@offerId)
        @url = @review.url
        redirect_to @url
    end
    
    def sitemap
        @base_url = [root_url]
    
        @reviews = Review.all
        @categories = Category.all
        @subCategories = SubCategory.all
    
        respond_to do |format|
          format.xml
        end
      end
    
    def feed
        @posts = Review.where("is_published = ?", "yes").order(:created_at).limit(50)
        respond_to do |format|
          format.rss { render :layout => false }
        end
    end
    
    def common_data
      @site = Site.order(:created_at).last
      @description = @site.description
      @image = @site.image
      @url = request.original_url
      @home = 0
        
      @headerCategories = Category.limit(12)
      @headerPopularReviews = Review.where("is_published = ?", "yes").order(score: :desc).limit(6)
      
      @footerCategories = Category.limit(6)
      @footerPopularReviews = Review.where("is_published = ?", "yes").order(score: :desc).limit(6)
    end
end
