require 'test_helper'

class BillPhotosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bill_photos_index_url
    assert_response :success
  end

  test "should get new" do
    get bill_photos_new_url
    assert_response :success
  end

  test "should get create" do
    get bill_photos_create_url
    assert_response :success
  end

end
