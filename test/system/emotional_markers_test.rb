require "application_system_test_case"

class EmotionalMarkersTest < ApplicationSystemTestCase
  setup do
    @emotional_marker = emotional_markers(:one)
  end

  test "visiting the index" do
    visit emotional_markers_url
    assert_selector "h1", text: "Emotional markers"
  end

  test "should create emotional marker" do
    visit emotional_markers_url
    click_on "New emotional marker"

    fill_in "Name", with: @emotional_marker.name
    click_on "Create Emotional marker"

    assert_text "Emotional marker was successfully created"
    click_on "Back"
  end

  test "should update Emotional marker" do
    visit emotional_marker_url(@emotional_marker)
    click_on "Edit this emotional marker", match: :first

    fill_in "Name", with: @emotional_marker.name
    click_on "Update Emotional marker"

    assert_text "Emotional marker was successfully updated"
    click_on "Back"
  end

  test "should destroy Emotional marker" do
    visit emotional_marker_url(@emotional_marker)
    click_on "Destroy this emotional marker", match: :first

    assert_text "Emotional marker was successfully destroyed"
  end
end
