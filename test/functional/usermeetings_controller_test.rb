require 'test_helper'

class UsermeetingsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:usermeetings)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_usermeeting
    assert_difference('Usermeeting.count') do
      post :create, :usermeeting => { }
    end

    assert_redirected_to usermeeting_path(assigns(:usermeeting))
  end

  def test_should_show_usermeeting
    get :show, :id => usermeetings(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => usermeetings(:one).id
    assert_response :success
  end

  def test_should_update_usermeeting
    put :update, :id => usermeetings(:one).id, :usermeeting => { }
    assert_redirected_to usermeeting_path(assigns(:usermeeting))
  end

  def test_should_destroy_usermeeting
    assert_difference('Usermeeting.count', -1) do
      delete :destroy, :id => usermeetings(:one).id
    end

    assert_redirected_to usermeetings_path
  end
end
