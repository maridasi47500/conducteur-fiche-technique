require "test_helper"

class MaterielNecessairesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @materiel_necessaire = materiel_necessaires(:one)
  end

  test "should get index" do
    get materiel_necessaires_url
    assert_response :success
  end

  test "should get new" do
    get new_materiel_necessaire_url
    assert_response :success
  end

  test "should create materiel_necessaire" do
    assert_difference("MaterielNecessaire.count") do
      post materiel_necessaires_url, params: { materiel_necessaire: { fiche_technique_id: @materiel_necessaire.fiche_technique_id, materiel_id: @materiel_necessaire.materiel_id, precisions_observations: @materiel_necessaire.precisions_observations, quantite: @materiel_necessaire.quantite } }
    end

    assert_redirected_to materiel_necessaire_url(MaterielNecessaire.last)
  end

  test "should show materiel_necessaire" do
    get materiel_necessaire_url(@materiel_necessaire)
    assert_response :success
  end

  test "should get edit" do
    get edit_materiel_necessaire_url(@materiel_necessaire)
    assert_response :success
  end

  test "should update materiel_necessaire" do
    patch materiel_necessaire_url(@materiel_necessaire), params: { materiel_necessaire: { fiche_technique_id: @materiel_necessaire.fiche_technique_id, materiel_id: @materiel_necessaire.materiel_id, precisions_observations: @materiel_necessaire.precisions_observations, quantite: @materiel_necessaire.quantite } }
    assert_redirected_to materiel_necessaire_url(@materiel_necessaire)
  end

  test "should destroy materiel_necessaire" do
    assert_difference("MaterielNecessaire.count", -1) do
      delete materiel_necessaire_url(@materiel_necessaire)
    end

    assert_redirected_to materiel_necessaires_url
  end
end
