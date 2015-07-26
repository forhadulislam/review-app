require 'test_helper'

class FrontControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get categories" do
    get :categories
    assert_response :success
  end

  test "should get subCategories" do
    get :subCategories
    assert_response :success
  end

  test "should get search" do
    get :search
    assert_response :success
  end

  test "should get reviewDetails" do
    get :reviewDetails
    assert_response :success
  end

end
