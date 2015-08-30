class FrontController < ApplicationController

    layout 'front'
    
    before_filter :common_data
    
    def index
        @title = "Current title"
        
        @subCategories = SubCategory.limit(6)
        @featuredReviews = Review.limit(8)
        
        @topProducts = Review.limit(6)
        @latestReviews = Review.limit(6)
    end
    
    def categories
        @slug = params[:categorySlug]
        @category = Category.find_by slug: @slug
        @subCategories = SubCategory.where("category_id = ?", @category.id)
        @subtitle = @category.title
        @description = @category.description
        
        @image = @category.image
    end
    
    def subCategories
        @catSlug = params[:categorySlug]
        @subCatSlug = params[:subCategorySlug]
        @category = Category.find_by slug: @catSlug
        @subCategory = SubCategory.find_by slug: @subCatSlug
        @subtitle = @subCategory.title
        @description = @subCategory.description
        
        @reviews = Review.where("sub_category_id = ?", @subCategory.id).order(score: :desc)
        
        @image = @subCategory.image
    end
    
    def search
        @query = query = params[:q]
        if !@query
            redirect_to root_url
            @query = "This is me"
        end
        @reviews = Review.where("title LIKE ? OR short_description LIKE ?", "%#{query}%", "%#{query}%").limit(50)
    end
    
    def reviewDetails
        @slug = params[:reviewSlug]
        @review = Review.find_by slug: @slug
        @subtitle = @review.title
        @description = @review.short_description
        
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
        @posts = Review.order(:created_at).limit(50)
        respond_to do |format|
          format.rss { render :layout => false }
        end
    end
    
    def common_data
      @site = Site.order(:created_at).last
      @description = @site.description
      @image = @site.image
      @url = request.original_url
        
      @headerCategories = Category.limit(15)
      @headerSubCategories = SubCategory.limit(15)
      
      @footerCategories = Category.limit(6)
      @footerPopularReviews = Review.limit(6)
    end
end
