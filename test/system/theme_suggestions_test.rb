require "application_system_test_case"

class ThemeSuggestionsTest < ApplicationSystemTestCase
  setup do
    @theme_suggestion = theme_suggestions(:one)
  end

  test "visiting the index" do
    visit theme_suggestions_url
    assert_selector "h1", text: "Theme suggestions"
  end

  test "should create theme suggestion" do
    visit theme_suggestions_url
    click_on "New theme suggestion"

    fill_in "Category", with: @theme_suggestion.category
    fill_in "Description", with: @theme_suggestion.description
    fill_in "Title", with: @theme_suggestion.title
    click_on "Create Theme suggestion"

    assert_text "Theme suggestion was successfully created"
    click_on "Back"
  end

  test "should update Theme suggestion" do
    visit theme_suggestion_url(@theme_suggestion)
    click_on "Edit this theme suggestion", match: :first

    fill_in "Category", with: @theme_suggestion.category
    fill_in "Description", with: @theme_suggestion.description
    fill_in "Title", with: @theme_suggestion.title
    click_on "Update Theme suggestion"

    assert_text "Theme suggestion was successfully updated"
    click_on "Back"
  end

  test "should destroy Theme suggestion" do
    visit theme_suggestion_url(@theme_suggestion)
    click_on "Destroy this theme suggestion", match: :first

    assert_text "Theme suggestion was successfully destroyed"
  end
end
