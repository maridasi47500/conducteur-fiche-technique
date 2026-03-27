require "application_system_test_case"

class MaterielNecessairesTest < ApplicationSystemTestCase
  setup do
    @materiel_necessaire = materiel_necessaires(:one)
  end

  test "visiting the index" do
    visit materiel_necessaires_url
    assert_selector "h1", text: "Materiel necessaires"
  end

  test "should create materiel necessaire" do
    visit materiel_necessaires_url
    click_on "New materiel necessaire"

    fill_in "Fiche technique", with: @materiel_necessaire.fiche_technique_id
    fill_in "Materiel", with: @materiel_necessaire.materiel_id
    fill_in "Precisions observations", with: @materiel_necessaire.precisions_observations
    fill_in "Quantite", with: @materiel_necessaire.quantite
    click_on "Create Materiel necessaire"

    assert_text "Materiel necessaire was successfully created"
    click_on "Back"
  end

  test "should update Materiel necessaire" do
    visit materiel_necessaire_url(@materiel_necessaire)
    click_on "Edit this materiel necessaire", match: :first

    fill_in "Fiche technique", with: @materiel_necessaire.fiche_technique_id
    fill_in "Materiel", with: @materiel_necessaire.materiel_id
    fill_in "Precisions observations", with: @materiel_necessaire.precisions_observations
    fill_in "Quantite", with: @materiel_necessaire.quantite
    click_on "Update Materiel necessaire"

    assert_text "Materiel necessaire was successfully updated"
    click_on "Back"
  end

  test "should destroy Materiel necessaire" do
    visit materiel_necessaire_url(@materiel_necessaire)
    click_on "Destroy this materiel necessaire", match: :first

    assert_text "Materiel necessaire was successfully destroyed"
  end
end
