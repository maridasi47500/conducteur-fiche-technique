require "test_helper"

class ThemeControllerTest < ActionDispatch::IntegrationTest
  test "should get projet_artistique" do
    get theme_projet_artistique_url
    assert_response :success
  end
end
