require 'test_helper'

class Instructor::LessonsControllerTest < ActionController::TestCase
 
  test 'Instructor sign in required' do
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

 test "update as a different user" do
    course = FactoryGirl.create(:course)
    user = FactoryGirl.create(:user)
    sign_in user
    post :create, {
        :lesson => {
          :title => 'Test',
          :subtitle => 'sub test'
        }
      }
    assert_response :unauthorized
  end


end
