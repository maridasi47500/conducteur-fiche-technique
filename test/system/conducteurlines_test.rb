require "application_system_test_case"

class ConducteurlinesTest < ApplicationSystemTestCase
  setup do
    @conducteurline = conducteurlines(:one)
  end

  test "visiting the index" do
    visit conducteurlines_url
    assert_selector "h1", text: "Conducteurlines"
  end

  test "should create conducteurline" do
    visit conducteurlines_url
    click_on "New conducteurline"

    fill_in "Conducteur", with: @conducteurline.conducteur_id
    fill_in "Duree", with: @conducteurline.duree
    fill_in "Interpretes", with: @conducteurline.interpretes
    fill_in "Lumieres ambiante", with: @conducteurline.lumieres_ambiante
    fill_in "Lumieres effet", with: @conducteurline.lumieres_effet
    fill_in "Machine brouillard", with: @conducteurline.machine_brouillard
    fill_in "Notes technicien", with: @conducteurline.notes_technicien
    fill_in "Sequenceaction", with: @conducteurline.sequenceaction
    fill_in "Videoprojection", with: @conducteurline.videoprojection
    click_on "Create Conducteurline"

    assert_text "Conducteurline was successfully created"
    click_on "Back"
  end

  test "should update Conducteurline" do
    visit conducteurline_url(@conducteurline)
    click_on "Edit this conducteurline", match: :first

    fill_in "Conducteur", with: @conducteurline.conducteur_id
    fill_in "Duree", with: @conducteurline.duree
    fill_in "Interpretes", with: @conducteurline.interpretes
    fill_in "Lumieres ambiante", with: @conducteurline.lumieres_ambiante
    fill_in "Lumieres effet", with: @conducteurline.lumieres_effet
    fill_in "Machine brouillard", with: @conducteurline.machine_brouillard
    fill_in "Notes technicien", with: @conducteurline.notes_technicien
    fill_in "Sequenceaction", with: @conducteurline.sequenceaction
    fill_in "Videoprojection", with: @conducteurline.videoprojection
    click_on "Update Conducteurline"

    assert_text "Conducteurline was successfully updated"
    click_on "Back"
  end

  test "should destroy Conducteurline" do
    visit conducteurline_url(@conducteurline)
    click_on "Destroy this conducteurline", match: :first

    assert_text "Conducteurline was successfully destroyed"
  end
end
