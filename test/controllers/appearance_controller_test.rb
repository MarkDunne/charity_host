require 'test_helper'

class AppearanceControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get template" do
    get :template
    assert_response :success
  end

end
