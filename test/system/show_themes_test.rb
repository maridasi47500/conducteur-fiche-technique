require "application_system_test_case"

class ShowThemesTest < ApplicationSystemTestCase
  setup do
    @show_theme = show_themes(:one)
  end

  test "visiting the index" do
    visit show_themes_url
    assert_selector "h1", text: "Show themes"
  end

  test "should create show theme" do
    visit show_themes_url
    click_on "New show theme"

    fill_in "Ai blind spot", with: @show_theme.ai_blind_spot
    fill_in "Emotional frequency", with: @show_theme.emotional_frequency
    fill_in "Philosophical inquiry", with: @show_theme.philosophical_inquiry
    fill_in "Projet artistique", with: @show_theme.projet_artistique_id
    fill_in "Title", with: @show_theme.title
    click_on "Create Show theme"

    assert_text "Show theme was successfully created"
    click_on "Back"
  end

  test "should update Show theme" do
    visit show_theme_url(@show_theme)
    click_on "Edit this show theme", match: :first

    fill_in "Ai blind spot", with: @show_theme.ai_blind_spot
    fill_in "Emotional frequency", with: @show_theme.emotional_frequency
    fill_in "Philosophical inquiry", with: @show_theme.philosophical_inquiry
    fill_in "Projet artistique", with: @show_theme.projet_artistique_id
    fill_in "Title", with: @show_theme.title
    click_on "Update Show theme"

    assert_text "Show theme was successfully updated"
    click_on "Back"
  end

  test "should destroy Show theme" do
    visit show_theme_url(@show_theme)
    click_on "Destroy this show theme", match: :first

    assert_text "Show theme was successfully destroyed"
  end
end
