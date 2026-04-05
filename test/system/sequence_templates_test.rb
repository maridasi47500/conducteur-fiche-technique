require "application_system_test_case"

class SequenceTemplatesTest < ApplicationSystemTestCase
  setup do
    @sequence_template = sequence_templates(:one)
  end

  test "visiting the index" do
    visit sequence_templates_url
    assert_selector "h1", text: "Sequence templates"
  end

  test "should create sequence template" do
    visit sequence_templates_url
    click_on "New sequence template"

    fill_in "Intensity", with: @sequence_template.intensity
    fill_in "Label", with: @sequence_template.label
    fill_in "Phase", with: @sequence_template.phase
    fill_in "Suggested light", with: @sequence_template.suggested_light
    fill_in "Target talent", with: @sequence_template.target_talent
    click_on "Create Sequence template"

    assert_text "Sequence template was successfully created"
    click_on "Back"
  end

  test "should update Sequence template" do
    visit sequence_template_url(@sequence_template)
    click_on "Edit this sequence template", match: :first

    fill_in "Intensity", with: @sequence_template.intensity
    fill_in "Label", with: @sequence_template.label
    fill_in "Phase", with: @sequence_template.phase
    fill_in "Suggested light", with: @sequence_template.suggested_light
    fill_in "Target talent", with: @sequence_template.target_talent
    click_on "Update Sequence template"

    assert_text "Sequence template was successfully updated"
    click_on "Back"
  end

  test "should destroy Sequence template" do
    visit sequence_template_url(@sequence_template)
    click_on "Destroy this sequence template", match: :first

    assert_text "Sequence template was successfully destroyed"
  end
end
