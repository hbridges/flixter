require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test 'Course Create Validate' do
  	user = FactoryGirl.create(:user)
 	course  = user.courses.build
 	assert_not course.valid?
 	assert_equal [:title, :description, :cost], course.errors.keys
  end
end
