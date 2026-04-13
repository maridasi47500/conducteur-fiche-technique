require "test_helper"

class ThemeSuggestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @theme_suggestion = theme_suggestions(:one)
  end

  test "should get index" do
    get theme_suggestions_url
    assert_response :success
  end

  test "should get new" do
    get new_theme_suggestion_url
    assert_response :success
  end

  test "should create theme_suggestion" do
    assert_difference("ThemeSuggestion.count") do
      post theme_suggestions_url, params: { theme_suggestion: { category: @theme_suggestion.category, description: @theme_suggestion.description, title: @theme_suggestion.title } }
    end

    assert_redirected_to theme_suggestion_url(ThemeSuggestion.last)
  end

  test "should show theme_suggestion" do
    get theme_suggestion_url(@theme_suggestion)
    assert_response :success
  end

  test "should get edit" do
    get edit_theme_suggestion_url(@theme_suggestion)
    assert_response :success
  end

  test "should update theme_suggestion" do
    patch theme_suggestion_url(@theme_suggestion), params: { theme_suggestion: { category: @theme_suggestion.category, description: @theme_suggestion.description, title: @theme_suggestion.title } }
    assert_redirected_to theme_suggestion_url(@theme_suggestion)
  end

  test "should destroy theme_suggestion" do
    assert_difference("ThemeSuggestion.count", -1) do
      delete theme_suggestion_url(@theme_suggestion)
    end

    assert_redirected_to theme_suggestions_url
  end
end
