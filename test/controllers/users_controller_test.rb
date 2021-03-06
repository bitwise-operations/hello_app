require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:michael)
    @other_user = users(:archer)
  end

  test 'should get index' do
    get :new
    assert_response :success
  end

  test 'should redirect edit when not logged in' do
    get :edit, params: { id: @user }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test 'should redirect update when not logged in' do
    patch :update, params: { id: @user, user: { name: @user.name, email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test 'should redirect edit when logged in as wrong user' do
    log_in_as(@other_user)
    get :edit, params: { id: @user }
    assert flash.empty?
    assert_redirected_to root_url
  end

  test 'should redirect update when logged in as wrong user' do
    log_in_as(@other_user)
    patch :update, params: { id: @user, user: { name: @user.name, email: @user.email } }
    assert flash.empty?
    assert_redirected_to root_url
  end

  test 'should redirect index when not logged in' do
    get :index
    assert_redirected_to login_url
  end

  # test "should get new" do
  #   get new_user_url
  #   assert_response :success
  # end

  # test "should create user" do
  #   assert_difference('User.count') do
  #     post users_url, params: { user: { email: @user.email, name: @user.name } }
  #   end

  #   assert_redirected_to user_url(User.last)
  # end

  # test "should show user" do
  #   get user_url(@user)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_user_url(@user)
  #   assert_response :success
  # end

  # test "should update user" do
  #   patch user_url(@user), params: { user: { email: @user.email, name: @user.name } }
  #   assert_redirected_to user_url(@user)
  # end

  # test "should destroy user" do
  #   assert_difference('User.count', -1) do
  #     delete user_url(@user)
  #   end

  #   assert_redirected_to users_url
  # end
end
