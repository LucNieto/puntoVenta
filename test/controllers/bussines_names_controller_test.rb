require 'test_helper'

class BussinesNamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bussines_name = bussines_names(:one)
  end

  test "should get index" do
    get bussines_names_url
    assert_response :success
  end

  test "should get new" do
    get new_bussines_name_url
    assert_response :success
  end

  test "should create bussines_name" do
    assert_difference('BussinesName.count') do
      post bussines_names_url, params: { bussines_name: { direccion_fiscal: @bussines_name.direccion_fiscal, nombre: @bussines_name.nombre, rfc: @bussines_name.rfc } }
    end

    assert_redirected_to bussines_name_url(BussinesName.last)
  end

  test "should show bussines_name" do
    get bussines_name_url(@bussines_name)
    assert_response :success
  end

  test "should get edit" do
    get edit_bussines_name_url(@bussines_name)
    assert_response :success
  end

  test "should update bussines_name" do
    patch bussines_name_url(@bussines_name), params: { bussines_name: { direccion_fiscal: @bussines_name.direccion_fiscal, nombre: @bussines_name.nombre, rfc: @bussines_name.rfc } }
    assert_redirected_to bussines_name_url(@bussines_name)
  end

  test "should destroy bussines_name" do
    assert_difference('BussinesName.count', -1) do
      delete bussines_name_url(@bussines_name)
    end

    assert_redirected_to bussines_names_url
  end
end
