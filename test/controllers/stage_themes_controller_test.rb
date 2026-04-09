require "test_helper"

class StageThemesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stage_theme = stage_themes(:one)
  end

  test "should get index" do
    get stage_themes_url
    assert_response :success
  end

  test "should get new" do
    get new_stage_theme_url
    assert_response :success
  end

  test "should create stage_theme" do
    assert_difference("StageTheme.count") do
      post stage_themes_url, params: { stage_theme: { name: @stage_theme.name } }
    end

    assert_redirected_to stage_theme_url(StageTheme.last)
  end

  test "should show stage_theme" do
    get stage_theme_url(@stage_theme)
    assert_response :success
  end

  test "should get edit" do
    get edit_stage_theme_url(@stage_theme)
    assert_response :success
  end

  test "should update stage_theme" do
    patch stage_theme_url(@stage_theme), params: { stage_theme: { name: @stage_theme.name } }
    assert_redirected_to stage_theme_url(@stage_theme)
  end

  test "should destroy stage_theme" do
    assert_difference("StageTheme.count", -1) do
      delete stage_theme_url(@stage_theme)
    end

    assert_redirected_to stage_themes_url
  end
end
