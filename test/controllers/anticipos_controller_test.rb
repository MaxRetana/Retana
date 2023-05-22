require "test_helper"

class AnticiposControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get anticipos_new_url
    assert_response :success
  end

  test "should get create" do
    get anticipos_create_url
    assert_response :success
  end
end
