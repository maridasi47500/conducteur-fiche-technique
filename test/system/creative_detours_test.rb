require "application_system_test_case"

class CreativeDetoursTest < ApplicationSystemTestCase
  setup do
    @creative_detour = creative_detours(:one)
  end

  test "visiting the index" do
    visit creative_detours_url
    assert_selector "h1", text: "Creative detours"
  end

  test "should create creative detour" do
    visit creative_detours_url
    click_on "New creative detour"

    fill_in "Action", with: @creative_detour.action
    fill_in "Challenge", with: @creative_detour.challenge
    fill_in "Concept", with: @creative_detour.concept
    fill_in "Database usage", with: @creative_detour.database_usage
    fill_in "Reaction", with: @creative_detour.reaction
    fill_in "Storage impact", with: @creative_detour.storage_impact
    fill_in "Title", with: @creative_detour.title
    click_on "Create Creative detour"

    assert_text "Creative detour was successfully created"
    click_on "Back"
  end

  test "should update Creative detour" do
    visit creative_detour_url(@creative_detour)
    click_on "Edit this creative detour", match: :first

    fill_in "Action", with: @creative_detour.action
    fill_in "Challenge", with: @creative_detour.challenge
    fill_in "Concept", with: @creative_detour.concept
    fill_in "Database usage", with: @creative_detour.database_usage
    fill_in "Reaction", with: @creative_detour.reaction
    fill_in "Storage impact", with: @creative_detour.storage_impact
    fill_in "Title", with: @creative_detour.title
    click_on "Update Creative detour"

    assert_text "Creative detour was successfully updated"
    click_on "Back"
  end

  test "should destroy Creative detour" do
    visit creative_detour_url(@creative_detour)
    click_on "Destroy this creative detour", match: :first

    assert_text "Creative detour was successfully destroyed"
  end
end
