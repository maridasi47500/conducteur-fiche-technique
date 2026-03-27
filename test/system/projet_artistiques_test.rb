require "application_system_test_case"

class ProjetArtistiquesTest < ApplicationSystemTestCase
  setup do
    @projet_artistique = projet_artistiques(:one)
  end

  test "visiting the index" do
    visit projet_artistiques_url
    assert_selector "h1", text: "Projet artistiques"
  end

  test "should create projet artistique" do
    visit projet_artistiques_url
    click_on "New projet artistique"

    fill_in "Conducteur", with: @projet_artistique.conducteur_id
    fill_in "Fiche technique", with: @projet_artistique.fiche_technique_id
    fill_in "Title", with: @projet_artistique.title
    fill_in "Username", with: @projet_artistique.username
    click_on "Create Projet artistique"

    assert_text "Projet artistique was successfully created"
    click_on "Back"
  end

  test "should update Projet artistique" do
    visit projet_artistique_url(@projet_artistique)
    click_on "Edit this projet artistique", match: :first

    fill_in "Conducteur", with: @projet_artistique.conducteur_id
    fill_in "Fiche technique", with: @projet_artistique.fiche_technique_id
    fill_in "Title", with: @projet_artistique.title
    fill_in "Username", with: @projet_artistique.username
    click_on "Update Projet artistique"

    assert_text "Projet artistique was successfully updated"
    click_on "Back"
  end

  test "should destroy Projet artistique" do
    visit projet_artistique_url(@projet_artistique)
    click_on "Destroy this projet artistique", match: :first

    assert_text "Projet artistique was successfully destroyed"
  end
end
