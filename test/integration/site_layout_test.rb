require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
  end

  test 'head signup' do
    get signup_path
    assert_select 'h1', 'Sign up'
    assert_select 'title', full_title('Sign up')
  end

  test 'full title helper' do
    assert_equal full_title('Help'), 'Help | Ruby on Rails Tutorial Sample App'
  end
end
