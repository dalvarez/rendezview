require 'test_helper'

class UsergroupsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:usergroups)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_usergroup
    assert_difference('Usergroup.count') do
      post :create, :usergroup => { }
    end

    assert_redirected_to usergroup_path(assigns(:usergroup))
  end

  def test_should_show_usergroup
    get :show, :id => usergroups(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => usergroups(:one).id
    assert_response :success
  end

  def test_should_update_usergroup
    put :update, :id => usergroups(:one).id, :usergroup => { }
    assert_redirected_to usergroup_path(assigns(:usergroup))
  end

  def test_should_destroy_usergroup
    assert_difference('Usergroup.count', -1) do
      delete :destroy, :id => usergroups(:one).id
    end

    assert_redirected_to usergroups_path
  end
end
