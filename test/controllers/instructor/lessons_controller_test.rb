require 'test_helper'

class Instructor::LessonsControllerTest < ActionController::TestCase
 
  test 'Instructor sign in required' do
    section = FactoryGirl.create(:section)
  	assert_no_difference 'Lesson.count' do
  		post :create, { 
        :section_id => section.id,
  			:lesson => {
  				:title => 'Test',
  				:subtitle => 'sub test'
  			}
  		}
  	end
  	assert_redirected_to new_user_session_path
  end

 test "update as a different user" do
    section = FactoryGirl.create(:section)
    user = FactoryGirl.create(:user)
    sign_in user
    post :create, {
        :section_id => section.id,
        :lesson => {
          :title => 'Test',
          :subtitle => 'sub test'
        }
      }
    assert_response :unauthorized
  end


end
