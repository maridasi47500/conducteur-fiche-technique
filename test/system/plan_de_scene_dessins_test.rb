require "application_system_test_case"

class PlanDeSceneDessinsTest < ApplicationSystemTestCase
  setup do
    @plan_de_scene_dessin = plan_de_scene_dessins(:one)
  end

  test "visiting the index" do
    visit plan_de_scene_dessins_url
    assert_selector "h1", text: "Plan de scene dessins"
  end

  test "should create plan de scene dessin" do
    visit plan_de_scene_dessins_url
    click_on "New plan de scene dessin"

    fill_in "Disposition", with: @plan_de_scene_dessin.disposition
    fill_in "Fiche technique", with: @plan_de_scene_dessin.fiche_technique_id
    fill_in "Materiel musicien", with: @plan_de_scene_dessin.materiel_musicien
    fill_in "Ordre", with: @plan_de_scene_dessin.ordre
    click_on "Create Plan de scene dessin"

    assert_text "Plan de scene dessin was successfully created"
    click_on "Back"
  end

  test "should update Plan de scene dessin" do
    visit plan_de_scene_dessin_url(@plan_de_scene_dessin)
    click_on "Edit this plan de scene dessin", match: :first

    fill_in "Disposition", with: @plan_de_scene_dessin.disposition
    fill_in "Fiche technique", with: @plan_de_scene_dessin.fiche_technique_id
    fill_in "Materiel musicien", with: @plan_de_scene_dessin.materiel_musicien
    fill_in "Ordre", with: @plan_de_scene_dessin.ordre
    click_on "Update Plan de scene dessin"

    assert_text "Plan de scene dessin was successfully updated"
    click_on "Back"
  end

  test "should destroy Plan de scene dessin" do
    visit plan_de_scene_dessin_url(@plan_de_scene_dessin)
    click_on "Destroy this plan de scene dessin", match: :first

    assert_text "Plan de scene dessin was successfully destroyed"
  end
end
