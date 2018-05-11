require 'test_helper'

class Reports::SalesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reports_sales_index_url
    assert_response :success
  end

  test "should get new" do
    get reports_sales_new_url
    assert_response :success
  end

end
