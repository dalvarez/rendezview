require 'test_helper'

class BusytimesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:busytimes)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_busytime
    assert_difference('Busytime.count') do
      post :create, :busytime => { }
    end

    assert_redirected_to busytime_path(assigns(:busytime))
  end

  def test_should_show_busytime
    get :show, :id => busytimes(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => busytimes(:one).id
    assert_response :success
  end

  def test_should_update_busytime
    put :update, :id => busytimes(:one).id, :busytime => { }
    assert_redirected_to busytime_path(assigns(:busytime))
  end

  def test_should_destroy_busytime
    assert_difference('Busytime.count', -1) do
      delete :destroy, :id => busytimes(:one).id
    end

    assert_redirected_to busytimes_path
  end
end
