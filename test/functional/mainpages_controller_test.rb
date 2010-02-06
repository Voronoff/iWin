require 'test_helper'

class MainpagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mainpages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mainpage" do
    assert_difference('Mainpage.count') do
      post :create, :mainpage => { }
    end

    assert_redirected_to mainpage_path(assigns(:mainpage))
  end

  test "should show mainpage" do
    get :show, :id => mainpages(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => mainpages(:one).to_param
    assert_response :success
  end

  test "should update mainpage" do
    put :update, :id => mainpages(:one).to_param, :mainpage => { }
    assert_redirected_to mainpage_path(assigns(:mainpage))
  end

  test "should destroy mainpage" do
    assert_difference('Mainpage.count', -1) do
      delete :destroy, :id => mainpages(:one).to_param
    end

    assert_redirected_to mainpages_path
  end
end
