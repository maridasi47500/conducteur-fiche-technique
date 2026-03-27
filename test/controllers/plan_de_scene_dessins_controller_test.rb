require "test_helper"

class PlanDeSceneDessinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plan_de_scene_dessin = plan_de_scene_dessins(:one)
  end

  test "should get index" do
    get plan_de_scene_dessins_url
    assert_response :success
  end

  test "should get new" do
    get new_plan_de_scene_dessin_url
    assert_response :success
  end

  test "should create plan_de_scene_dessin" do
    assert_difference("PlanDeSceneDessin.count") do
      post plan_de_scene_dessins_url, params: { plan_de_scene_dessin: { disposition: @plan_de_scene_dessin.disposition, fiche_technique_id: @plan_de_scene_dessin.fiche_technique_id, materiel_musicien: @plan_de_scene_dessin.materiel_musicien, ordre: @plan_de_scene_dessin.ordre } }
    end

    assert_redirected_to plan_de_scene_dessin_url(PlanDeSceneDessin.last)
  end

  test "should show plan_de_scene_dessin" do
    get plan_de_scene_dessin_url(@plan_de_scene_dessin)
    assert_response :success
  end

  test "should get edit" do
    get edit_plan_de_scene_dessin_url(@plan_de_scene_dessin)
    assert_response :success
  end

  test "should update plan_de_scene_dessin" do
    patch plan_de_scene_dessin_url(@plan_de_scene_dessin), params: { plan_de_scene_dessin: { disposition: @plan_de_scene_dessin.disposition, fiche_technique_id: @plan_de_scene_dessin.fiche_technique_id, materiel_musicien: @plan_de_scene_dessin.materiel_musicien, ordre: @plan_de_scene_dessin.ordre } }
    assert_redirected_to plan_de_scene_dessin_url(@plan_de_scene_dessin)
  end

  test "should destroy plan_de_scene_dessin" do
    assert_difference("PlanDeSceneDessin.count", -1) do
      delete plan_de_scene_dessin_url(@plan_de_scene_dessin)
    end

    assert_redirected_to plan_de_scene_dessins_url
  end
end
