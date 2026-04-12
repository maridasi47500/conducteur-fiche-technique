require "application_system_test_case"

class ShareYourGapsTest < ApplicationSystemTestCase
  setup do
    @share_your_gap = share_your_gaps(:one)
  end

  test "visiting the index" do
    visit share_your_gaps_url
    assert_selector "h1", text: "Share your gaps"
  end

  test "should create share your gap" do
    visit share_your_gaps_url
    click_on "New share your gap"

    fill_in "Analysis", with: @share_your_gap.analysis
    fill_in "Conducteur", with: @share_your_gap.conducteur_id
    fill_in "Interpretation", with: @share_your_gap.interpretation
    fill_in "Response", with: @share_your_gap.response
    click_on "Create Share your gap"

    assert_text "Share your gap was successfully created"
    click_on "Back"
  end

  test "should update Share your gap" do
    visit share_your_gap_url(@share_your_gap)
    click_on "Edit this share your gap", match: :first

    fill_in "Analysis", with: @share_your_gap.analysis
    fill_in "Conducteur", with: @share_your_gap.conducteur_id
    fill_in "Interpretation", with: @share_your_gap.interpretation
    fill_in "Response", with: @share_your_gap.response
    click_on "Update Share your gap"

    assert_text "Share your gap was successfully updated"
    click_on "Back"
  end

  test "should destroy Share your gap" do
    visit share_your_gap_url(@share_your_gap)
    click_on "Destroy this share your gap", match: :first

    assert_text "Share your gap was successfully destroyed"
  end
end
