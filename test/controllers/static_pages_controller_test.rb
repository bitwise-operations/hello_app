require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tutorial_text = 'Ruby on Rails Tutorial Sample App'
  end

  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "Home | #{@tutorial_text}"
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", "Help | #{@tutorial_text}"
  end
  
  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "About | #{@tutorial_text}"
  end

  test "should get contact" do
    get static_pages_contact_url
    assert_response :success
  end
end
