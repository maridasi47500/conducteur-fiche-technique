require "application_system_test_case"

class DirectiveArtistiquesTest < ApplicationSystemTestCase
  setup do
    @directive_artistique = directive_artistiques(:one)
  end

  test "visiting the index" do
    visit directive_artistiques_url
    assert_selector "h1", text: "Directive artistiques"
  end

  test "should create directive artistique" do
    visit directive_artistiques_url
    click_on "New directive artistique"

    fill_in "Default duree", with: @directive_artistique.default_duree
    fill_in "Default interpretes", with: @directive_artistique.default_interpretes
    fill_in "Default lumieres ambiante", with: @directive_artistique.default_lumieres_ambiante
    fill_in "Default lumieres effet", with: @directive_artistique.default_lumieres_effet
    fill_in "Default notes technicien", with: @directive_artistique.default_notes_technicien
    fill_in "Default sequenceaction", with: @directive_artistique.default_sequenceaction
    fill_in "Default son", with: @directive_artistique.default_son
    fill_in "Default videoprojection", with: @directive_artistique.default_videoprojection
    fill_in "Name", with: @directive_artistique.name
    fill_in "Stage theme", with: @directive_artistique.stage_theme_id
    click_on "Create Directive artistique"

    assert_text "Directive artistique was successfully created"
    click_on "Back"
  end

  test "should update Directive artistique" do
    visit directive_artistique_url(@directive_artistique)
    click_on "Edit this directive artistique", match: :first

    fill_in "Default duree", with: @directive_artistique.default_duree
    fill_in "Default interpretes", with: @directive_artistique.default_interpretes
    fill_in "Default lumieres ambiante", with: @directive_artistique.default_lumieres_ambiante
    fill_in "Default lumieres effet", with: @directive_artistique.default_lumieres_effet
    fill_in "Default notes technicien", with: @directive_artistique.default_notes_technicien
    fill_in "Default sequenceaction", with: @directive_artistique.default_sequenceaction
    fill_in "Default son", with: @directive_artistique.default_son
    fill_in "Default videoprojection", with: @directive_artistique.default_videoprojection
    fill_in "Name", with: @directive_artistique.name
    fill_in "Stage theme", with: @directive_artistique.stage_theme_id
    click_on "Update Directive artistique"

    assert_text "Directive artistique was successfully updated"
    click_on "Back"
  end

  test "should destroy Directive artistique" do
    visit directive_artistique_url(@directive_artistique)
    click_on "Destroy this directive artistique", match: :first

    assert_text "Directive artistique was successfully destroyed"
  end
end
