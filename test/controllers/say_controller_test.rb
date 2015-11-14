require 'test_helper'

class SayControllerTest < ActionController::TestCase
  test "should get hello" do
    get :hello
    assert_response :success
  end
  test "should say hello rails in json" do
    get :hello
    assert_equal "{\"hello\":\"Rails!\"}", @response.body
  end
  test "should say hello dave in json" do
    get(:hello, {'user' => "Dave"})
    assert_equal "{\"hello\":\"Dave!\"}", @response.body
  end

end
