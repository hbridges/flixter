require 'test_helper'

class Instructor::CoursesControllerTest < ActionController::TestCase
	test 'Instructor create redirect' do 
		user = FactoryGirl.create(:user)
		sign_in user
		assert_difference "Course.count" do  
			post :create, {:course =>{:title =>'test', :description =>'testing this', :cost => 10}}
		end
		course = Course.last
		assert_redirected_to instructor_course_path(course)

	end

	test 'Invalid course create' do
		user = FactoryGirl.create(:user)
		sign_in user
		assert_no_difference "Course.count" do
			post :create, {
				:course => {
					:title => '',
					:cost => 10
				}
			}
		end
		assert_response :unprocessable_entity
	end

	  test "user not signed in" do
	    assert_no_difference 'Course.count' do
	      post :create, {
	      	  :course => {
	          	:title=> 'test',
	          	:cost => 10
	        }
	      }
	    end
	    assert_redirected_to new_user_session_path
	  end

end
