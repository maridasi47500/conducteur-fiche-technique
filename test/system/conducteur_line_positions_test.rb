require "application_system_test_case"

class ConducteurLinePositionsTest < ApplicationSystemTestCase
  setup do
    @conducteur_line_position = conducteur_line_positions(:one)
  end

  test "visiting the index" do
    visit conducteur_line_positions_url
    assert_selector "h1", text: "Conducteur line positions"
  end

  test "should create conducteur line position" do
    visit conducteur_line_positions_url
    click_on "New conducteur line position"

    fill_in "Conducteurline id", with: @conducteur_line_position.conducteurline_id_id
    fill_in "Coord x", with: @conducteur_line_position.coord_x
    fill_in "Coord y", with: @conducteur_line_position.coord_y
    fill_in "Materiel", with: @conducteur_line_position.materiel_id
    fill_in "Transition type", with: @conducteur_line_position.transition_type
    click_on "Create Conducteur line position"

    assert_text "Conducteur line position was successfully created"
    click_on "Back"
  end

  test "should update Conducteur line position" do
    visit conducteur_line_position_url(@conducteur_line_position)
    click_on "Edit this conducteur line position", match: :first

    fill_in "Conducteurline id", with: @conducteur_line_position.conducteurline_id_id
    fill_in "Coord x", with: @conducteur_line_position.coord_x
    fill_in "Coord y", with: @conducteur_line_position.coord_y
    fill_in "Materiel", with: @conducteur_line_position.materiel_id
    fill_in "Transition type", with: @conducteur_line_position.transition_type
    click_on "Update Conducteur line position"

    assert_text "Conducteur line position was successfully updated"
    click_on "Back"
  end

  test "should destroy Conducteur line position" do
    visit conducteur_line_position_url(@conducteur_line_position)
    click_on "Destroy this conducteur line position", match: :first

    assert_text "Conducteur line position was successfully destroyed"
  end
end
