require "application_system_test_case"

class MetierDependenciesTest < ApplicationSystemTestCase
  setup do
    @metier_dependency = metier_dependencies(:one)
  end

  test "visiting the index" do
    visit metier_dependencies_url
    assert_selector "h1", text: "Metier dependencies"
  end

  test "should create metier dependency" do
    visit metier_dependencies_url
    click_on "New metier dependency"

    fill_in "Materiel", with: @metier_dependency.materiel_id
    fill_in "Note", with: @metier_dependency.note
    fill_in "Qty multiplier", with: @metier_dependency.qty_multiplier
    fill_in "Required item", with: @metier_dependency.required_item_id
    click_on "Create Metier dependency"

    assert_text "Metier dependency was successfully created"
    click_on "Back"
  end

  test "should update Metier dependency" do
    visit metier_dependency_url(@metier_dependency)
    click_on "Edit this metier dependency", match: :first

    fill_in "Materiel", with: @metier_dependency.materiel_id
    fill_in "Note", with: @metier_dependency.note
    fill_in "Qty multiplier", with: @metier_dependency.qty_multiplier
    fill_in "Required item", with: @metier_dependency.required_item_id
    click_on "Update Metier dependency"

    assert_text "Metier dependency was successfully updated"
    click_on "Back"
  end

  test "should destroy Metier dependency" do
    visit metier_dependency_url(@metier_dependency)
    click_on "Destroy this metier dependency", match: :first

    assert_text "Metier dependency was successfully destroyed"
  end
end
