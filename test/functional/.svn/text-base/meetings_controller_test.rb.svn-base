require 'test_helper'

class MeetingsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:meetings)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_meeting
    assert_difference('Meeting.count') do
      post :create, :meeting => { }
    end

    assert_redirected_to meeting_path(assigns(:meeting))
  end

  def test_should_show_meeting
    get :show, :id => meetings(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => meetings(:one).id
    assert_response :success
  end

  def test_should_update_meeting
    put :update, :id => meetings(:one).id, :meeting => { }
    assert_redirected_to meeting_path(assigns(:meeting))
  end

  def test_should_destroy_meeting
    assert_difference('Meeting.count', -1) do
      delete :destroy, :id => meetings(:one).id
    end

    assert_redirected_to meetings_path
  end
end
