require "test_helper"

class PaymentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get payments_new_url
    assert_response :success
  end

  test "should post create" do
    post payments_create_url
    assert_response :success
  end
end
