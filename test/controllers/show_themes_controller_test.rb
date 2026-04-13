require "test_helper"

class ShowThemesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @show_theme = show_themes(:one)
  end

  test "should get index" do
    get show_themes_url
    assert_response :success
  end

  test "should get new" do
    get new_show_theme_url
    assert_response :success
  end

  test "should create show_theme" do
    assert_difference("ShowTheme.count") do
      post show_themes_url, params: { show_theme: { ai_blind_spot: @show_theme.ai_blind_spot, emotional_frequency: @show_theme.emotional_frequency, philosophical_inquiry: @show_theme.philosophical_inquiry, projet_artistique_id: @show_theme.projet_artistique_id, title: @show_theme.title } }
    end

    assert_redirected_to show_theme_url(ShowTheme.last)
  end

  test "should show show_theme" do
    get show_theme_url(@show_theme)
    assert_response :success
  end

  test "should get edit" do
    get edit_show_theme_url(@show_theme)
    assert_response :success
  end

  test "should update show_theme" do
    patch show_theme_url(@show_theme), params: { show_theme: { ai_blind_spot: @show_theme.ai_blind_spot, emotional_frequency: @show_theme.emotional_frequency, philosophical_inquiry: @show_theme.philosophical_inquiry, projet_artistique_id: @show_theme.projet_artistique_id, title: @show_theme.title } }
    assert_redirected_to show_theme_url(@show_theme)
  end

  test "should destroy show_theme" do
    assert_difference("ShowTheme.count", -1) do
      delete show_theme_url(@show_theme)
    end

    assert_redirected_to show_themes_url
  end
end
