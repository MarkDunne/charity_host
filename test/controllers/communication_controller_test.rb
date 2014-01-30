require 'test_helper'

class CommunicationControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get create_message" do
    get :create_message
    assert_response :success
  end

end
