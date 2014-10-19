require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "a user should enter a first name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end
  test "a user should enter a last name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end

  test "a user should enter a profile name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

	test "a user should have a unique profile name" do
		user = User.new
		user.first_name = users(:ahmed).first_name
    user.last_name = users(:ahmed).last_name
    user.profile_name = users(:ahmed).profile_name
    user.email = users(:ahmed).email
    user.password = "password"
		user.password_confirmation = "password"
		assert !user.save
		# puts user.errors.inspect
		assert !user.errors[:profile_name].empty?
	end

  test "a user should enter a profile name without spaces" do
    user = users(:ahmed)
    user.profile_name = "ahmed nadar with spaces"
    assert !user.save

    assert !user.errors[:profile_name].empty?
    assert user.errors[:profile_name].include?("Must be formatted correctly.")
  end
end