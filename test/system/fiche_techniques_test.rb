require "application_system_test_case"

class FicheTechniquesTest < ApplicationSystemTestCase
  setup do
    @fiche_technique = fiche_techniques(:one)
  end

  test "visiting the index" do
    visit fiche_techniques_url
    assert_selector "h1", text: "Fiche techniques"
  end

  test "should create fiche technique" do
    visit fiche_techniques_url
    click_on "New fiche technique"

    fill_in "Date", with: @fiche_technique.date
    fill_in "Eleve responsable", with: @fiche_technique.eleve_responsable
    fill_in "Name event", with: @fiche_technique.name_event
    fill_in "Notes complementaires", with: @fiche_technique.notes_complementaires
    fill_in "Professeur referent", with: @fiche_technique.professeur_referent
    click_on "Create Fiche technique"

    assert_text "Fiche technique was successfully created"
    click_on "Back"
  end

  test "should update Fiche technique" do
    visit fiche_technique_url(@fiche_technique)
    click_on "Edit this fiche technique", match: :first

    fill_in "Date", with: @fiche_technique.date
    fill_in "Eleve responsable", with: @fiche_technique.eleve_responsable
    fill_in "Name event", with: @fiche_technique.name_event
    fill_in "Notes complementaires", with: @fiche_technique.notes_complementaires
    fill_in "Professeur referent", with: @fiche_technique.professeur_referent
    click_on "Update Fiche technique"

    assert_text "Fiche technique was successfully updated"
    click_on "Back"
  end

  test "should destroy Fiche technique" do
    visit fiche_technique_url(@fiche_technique)
    click_on "Destroy this fiche technique", match: :first

    assert_text "Fiche technique was successfully destroyed"
  end
end
