require 'test_helper'

class RamensControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ramens_index_url
    assert_response :success
  end

  test "should get show" do
    get ramens_show_url
    assert_response :success
  end

  test "should get new" do
    get ramens_new_url
    assert_response :success
  end

  test "should get edit" do
    get ramens_edit_url
    assert_response :success
  end

end
