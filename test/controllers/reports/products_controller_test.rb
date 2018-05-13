require 'test_helper'

class Reports::ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reports_products_index_url
    assert_response :success
  end

  test "should get new" do
    get reports_products_new_url
    assert_response :success
  end

end
