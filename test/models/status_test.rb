require 'test_helper'

class StatusTest < ActiveSupport::TestCase
	test "a user should enter a content for status" do
		status = Status.new
		assert !status.save
		assert !status.errors[:content].empty?
	end

	test "status length should be more than 3 letters" do
		status = Status.new
		status.content = "hey"
		assert !status.save
		assert !status.errors[:content].empty?
	end

	test "that status should has a user id" do 
	  status = Status.new
	  status.content = "Howdy"
	  assert !status.save
	  assert !status.errors[:user_id].empty?
	end
end