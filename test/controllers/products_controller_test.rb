require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get products_index_url
    assert_response :success
  end

  test "should get new" do
    get products_new_url
    assert_response :success
  end

  test "should get show" do
    get products_show_url
    assert_response :success
  end

  test "should get edit" do
    get products_edit_url
    assert_response :success
  end

  test "should get own" do
    get products_own_url
    assert_response :success
  end
end
