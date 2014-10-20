require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
  test "that /login routes opens the login page" do
    get login_path
    assert_response :success
  end
  
  test "that /join routes opens the Join or Signup page" do
    get join_path
    assert_response :success
  end
  
  test "that logout routes gets user to signout and exit their account" do
    get logout_path
    assert_response :redirect
    assert_redirected_to root_path
  end

  test "that /settings routes opens the settings page" do
    get settings_path
    assert_response :redirect
    get login_path
    assert_response :success
  end

end
