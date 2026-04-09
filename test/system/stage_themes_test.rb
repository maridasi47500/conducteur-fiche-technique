require "application_system_test_case"

class StageThemesTest < ApplicationSystemTestCase
  setup do
    @stage_theme = stage_themes(:one)
  end

  test "visiting the index" do
    visit stage_themes_url
    assert_selector "h1", text: "Stage themes"
  end

  test "should create stage theme" do
    visit stage_themes_url
    click_on "New stage theme"

    fill_in "Name", with: @stage_theme.name
    click_on "Create Stage theme"

    assert_text "Stage theme was successfully created"
    click_on "Back"
  end

  test "should update Stage theme" do
    visit stage_theme_url(@stage_theme)
    click_on "Edit this stage theme", match: :first

    fill_in "Name", with: @stage_theme.name
    click_on "Update Stage theme"

    assert_text "Stage theme was successfully updated"
    click_on "Back"
  end

  test "should destroy Stage theme" do
    visit stage_theme_url(@stage_theme)
    click_on "Destroy this stage theme", match: :first

    assert_text "Stage theme was successfully destroyed"
  end
end
