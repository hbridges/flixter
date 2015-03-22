require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test 'Course Create Validate' do
  	user = User.create :email => 'test@gmail.com', :password => 'password'
 	course  = user.courses.build
 	assert_not course.valid?
 	assert_equal [:title, :description, :cost], course.error.keys
  end
end
