require "test_helper"

class MetierDependenciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @metier_dependency = metier_dependencies(:one)
  end

  test "should get index" do
    get metier_dependencies_url
    assert_response :success
  end

  test "should get new" do
    get new_metier_dependency_url
    assert_response :success
  end

  test "should create metier_dependency" do
    assert_difference("MetierDependency.count") do
      post metier_dependencies_url, params: { metier_dependency: { materiel_id: @metier_dependency.materiel_id, note: @metier_dependency.note, qty_multiplier: @metier_dependency.qty_multiplier, required_item_id: @metier_dependency.required_item_id } }
    end

    assert_redirected_to metier_dependency_url(MetierDependency.last)
  end

  test "should show metier_dependency" do
    get metier_dependency_url(@metier_dependency)
    assert_response :success
  end

  test "should get edit" do
    get edit_metier_dependency_url(@metier_dependency)
    assert_response :success
  end

  test "should update metier_dependency" do
    patch metier_dependency_url(@metier_dependency), params: { metier_dependency: { materiel_id: @metier_dependency.materiel_id, note: @metier_dependency.note, qty_multiplier: @metier_dependency.qty_multiplier, required_item_id: @metier_dependency.required_item_id } }
    assert_redirected_to metier_dependency_url(@metier_dependency)
  end

  test "should destroy metier_dependency" do
    assert_difference("MetierDependency.count", -1) do
      delete metier_dependency_url(@metier_dependency)
    end

    assert_redirected_to metier_dependencies_url
  end
end
