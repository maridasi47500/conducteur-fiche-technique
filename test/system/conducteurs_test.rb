require "application_system_test_case"

class ConducteursTest < ApplicationSystemTestCase
  setup do
    @conducteur = conducteurs(:one)
  end

  test "visiting the index" do
    visit conducteurs_url
    assert_selector "h1", text: "Conducteurs"
  end

  test "should create conducteur" do
    visit conducteurs_url
    click_on "New conducteur"

    fill_in "Title", with: @conducteur.title
    fill_in "Username", with: @conducteur.username
    click_on "Create Conducteur"

    assert_text "Conducteur was successfully created"
    click_on "Back"
  end

  test "should update Conducteur" do
    visit conducteur_url(@conducteur)
    click_on "Edit this conducteur", match: :first

    fill_in "Title", with: @conducteur.title
    fill_in "Username", with: @conducteur.username
    click_on "Update Conducteur"

    assert_text "Conducteur was successfully updated"
    click_on "Back"
  end

  test "should destroy Conducteur" do
    visit conducteur_url(@conducteur)
    click_on "Destroy this conducteur", match: :first

    assert_text "Conducteur was successfully destroyed"
  end
end
