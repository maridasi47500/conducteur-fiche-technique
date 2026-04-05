require "application_system_test_case"

class AmbianceOptionsTest < ApplicationSystemTestCase
  setup do
    @ambiance_option = ambiance_options(:one)
  end

  test "visiting the index" do
    visit ambiance_options_url
    assert_selector "h1", text: "Ambiance options"
  end

  test "should create ambiance option" do
    visit ambiance_options_url
    click_on "New ambiance option"

    fill_in "Category", with: @ambiance_option.category
    fill_in "Style", with: @ambiance_option.style_id
    fill_in "Value", with: @ambiance_option.value
    click_on "Create Ambiance option"

    assert_text "Ambiance option was successfully created"
    click_on "Back"
  end

  test "should update Ambiance option" do
    visit ambiance_option_url(@ambiance_option)
    click_on "Edit this ambiance option", match: :first

    fill_in "Category", with: @ambiance_option.category
    fill_in "Style", with: @ambiance_option.style_id
    fill_in "Value", with: @ambiance_option.value
    click_on "Update Ambiance option"

    assert_text "Ambiance option was successfully updated"
    click_on "Back"
  end

  test "should destroy Ambiance option" do
    visit ambiance_option_url(@ambiance_option)
    click_on "Destroy this ambiance option", match: :first

    assert_text "Ambiance option was successfully destroyed"
  end
end
