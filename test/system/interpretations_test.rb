require "application_system_test_case"

class InterpretationsTest < ApplicationSystemTestCase
  setup do
    @interpretation = interpretations(:one)
  end

  test "visiting the index" do
    visit interpretations_url
    assert_selector "h1", text: "Interpretations"
  end

  test "should create interpretation" do
    visit interpretations_url
    click_on "New interpretation"

    fill_in "Artistic truth", with: @interpretation.artistic_truth
    fill_in "Conducteur", with: @interpretation.conducteur_id
    fill_in "Human judgment", with: @interpretation.human_judgment
    fill_in "Machine analysis", with: @interpretation.machine_analysis
    fill_in "The gap", with: @interpretation.the_gap
    click_on "Create Interpretation"

    assert_text "Interpretation was successfully created"
    click_on "Back"
  end

  test "should update Interpretation" do
    visit interpretation_url(@interpretation)
    click_on "Edit this interpretation", match: :first

    fill_in "Artistic truth", with: @interpretation.artistic_truth
    fill_in "Conducteur", with: @interpretation.conducteur_id
    fill_in "Human judgment", with: @interpretation.human_judgment
    fill_in "Machine analysis", with: @interpretation.machine_analysis
    fill_in "The gap", with: @interpretation.the_gap
    click_on "Update Interpretation"

    assert_text "Interpretation was successfully updated"
    click_on "Back"
  end

  test "should destroy Interpretation" do
    visit interpretation_url(@interpretation)
    click_on "Destroy this interpretation", match: :first

    assert_text "Interpretation was successfully destroyed"
  end
end
