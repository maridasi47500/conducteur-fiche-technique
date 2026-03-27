require "test_helper"

class FicheTechniquesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fiche_technique = fiche_techniques(:one)
  end

  test "should get index" do
    get fiche_techniques_url
    assert_response :success
  end

  test "should get new" do
    get new_fiche_technique_url
    assert_response :success
  end

  test "should create fiche_technique" do
    assert_difference("FicheTechnique.count") do
      post fiche_techniques_url, params: { fiche_technique: { date: @fiche_technique.date, eleve_responsable: @fiche_technique.eleve_responsable, name_event: @fiche_technique.name_event, notes_complementaires: @fiche_technique.notes_complementaires, professeur_referent: @fiche_technique.professeur_referent } }
    end

    assert_redirected_to fiche_technique_url(FicheTechnique.last)
  end

  test "should show fiche_technique" do
    get fiche_technique_url(@fiche_technique)
    assert_response :success
  end

  test "should get edit" do
    get edit_fiche_technique_url(@fiche_technique)
    assert_response :success
  end

  test "should update fiche_technique" do
    patch fiche_technique_url(@fiche_technique), params: { fiche_technique: { date: @fiche_technique.date, eleve_responsable: @fiche_technique.eleve_responsable, name_event: @fiche_technique.name_event, notes_complementaires: @fiche_technique.notes_complementaires, professeur_referent: @fiche_technique.professeur_referent } }
    assert_redirected_to fiche_technique_url(@fiche_technique)
  end

  test "should destroy fiche_technique" do
    assert_difference("FicheTechnique.count", -1) do
      delete fiche_technique_url(@fiche_technique)
    end

    assert_redirected_to fiche_techniques_url
  end
end
