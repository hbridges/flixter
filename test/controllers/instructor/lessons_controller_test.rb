require 'test_helper'

class Instructor::LessonsControllerTest < ActionController::TestCase
 
  test 'Instructor sign in' do
  	assert_no_difference 'Lesson.count' do
  		post :create, {
  			:lesson => {
  				:title => 'Test',
  				:subtitle => 'sub test'
  			}
  		}
  	end
  	assert_redirected_to new_user_session_path
  end


end
