require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
  setup do
    @review = reviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create review" do
    assert_difference('Review.count') do
      post :create, review: { category_id: @review.category_id, features: @review.features, first_paragraph: @review.first_paragraph, image: @review.image, is_featured: @review.is_featured, is_published: @review.is_published, lowest_price: @review.lowest_price, price: @review.price, score: @review.score, second_paragraph: @review.second_paragraph, short_description: @review.short_description, slug: @review.slug, sub_category_id: @review.sub_category_id, support: @review.support, third_paragraph: @review.third_paragraph, title: @review.title, top_features: @review.top_features, total_viewed: @review.total_viewed, url: @review.url }
    end

    assert_redirected_to review_path(assigns(:review))
  end

  test "should show review" do
    get :show, id: @review
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @review
    assert_response :success
  end

  test "should update review" do
    patch :update, id: @review, review: { category_id: @review.category_id, features: @review.features, first_paragraph: @review.first_paragraph, image: @review.image, is_featured: @review.is_featured, is_published: @review.is_published, lowest_price: @review.lowest_price, price: @review.price, score: @review.score, second_paragraph: @review.second_paragraph, short_description: @review.short_description, slug: @review.slug, sub_category_id: @review.sub_category_id, support: @review.support, third_paragraph: @review.third_paragraph, title: @review.title, top_features: @review.top_features, total_viewed: @review.total_viewed, url: @review.url }
    assert_redirected_to review_path(assigns(:review))
  end

  test "should destroy review" do
    assert_difference('Review.count', -1) do
      delete :destroy, id: @review
    end

    assert_redirected_to reviews_path
  end
end
