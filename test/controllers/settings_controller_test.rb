require 'test_helper'

class SettingsControllerTest < ActionController::TestCase
  test "should get shou view" do
    get :show, id: users(:ahmed).profile_name
    assert_response :success
    assert_template 'settings/show'
  end

  test "should render a 404 on profile not found" do
  	get :show, id: "not correct profile"
  	assert_response :not_found
  end
	
	test "that variables are assigned on a sucessful profile viewing" do
		get :show, id: users(:ahmed).profile_name		
		assert assigns(:user) # make sure profile name is assigned to a user
		assert_not_empty assigns(:statuses) #make sure user profile show many satatuses
	end

  test "only shows the correct user's statuses" do
    get :show, id: users(:ahmed).profile_name   
    assigns(:statuses).each do |status|
      assert_equal users(:ahmed), status.user
    end
  end
end
