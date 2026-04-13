require "application_system_test_case"

class ArtisticLimitsTest < ApplicationSystemTestCase
  setup do
    @artistic_limit = artistic_limits(:one)
  end

  test "visiting the index" do
    visit artistic_limits_url
    assert_selector "h1", text: "Artistic limits"
  end

  test "should create artistic limit" do
    visit artistic_limits_url
    click_on "New artistic limit"

    fill_in "Conducteur", with: @artistic_limit.conducteur_id
    fill_in "Contradiction", with: @artistic_limit.contradiction
    fill_in "Emotional truth", with: @artistic_limit.emotional_truth
    fill_in "Left unintentional", with: @artistic_limit.left_unintentional
    fill_in "What i want", with: @artistic_limit.what_i_want
    fill_in "Why untranslatable", with: @artistic_limit.why_untranslatable
    click_on "Create Artistic limit"

    assert_text "Artistic limit was successfully created"
    click_on "Back"
  end

  test "should update Artistic limit" do
    visit artistic_limit_url(@artistic_limit)
    click_on "Edit this artistic limit", match: :first

    fill_in "Conducteur", with: @artistic_limit.conducteur_id
    fill_in "Contradiction", with: @artistic_limit.contradiction
    fill_in "Emotional truth", with: @artistic_limit.emotional_truth
    fill_in "Left unintentional", with: @artistic_limit.left_unintentional
    fill_in "What i want", with: @artistic_limit.what_i_want
    fill_in "Why untranslatable", with: @artistic_limit.why_untranslatable
    click_on "Update Artistic limit"

    assert_text "Artistic limit was successfully updated"
    click_on "Back"
  end

  test "should destroy Artistic limit" do
    visit artistic_limit_url(@artistic_limit)
    click_on "Destroy this artistic limit", match: :first

    assert_text "Artistic limit was successfully destroyed"
  end
end
