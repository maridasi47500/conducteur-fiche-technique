require "test_helper"

class ConducteurLinePositionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @conducteur_line_position = conducteur_line_positions(:one)
  end

  test "should get index" do
    get conducteur_line_positions_url
    assert_response :success
  end

  test "should get new" do
    get new_conducteur_line_position_url
    assert_response :success
  end

  test "should create conducteur_line_position" do
    assert_difference("ConducteurLinePosition.count") do
      post conducteur_line_positions_url, params: { conducteur_line_position: { conducteurline_id_id: @conducteur_line_position.conducteurline_id_id, coord_x: @conducteur_line_position.coord_x, coord_y: @conducteur_line_position.coord_y, materiel_id: @conducteur_line_position.materiel_id, transition_type: @conducteur_line_position.transition_type } }
    end

    assert_redirected_to conducteur_line_position_url(ConducteurLinePosition.last)
  end

  test "should show conducteur_line_position" do
    get conducteur_line_position_url(@conducteur_line_position)
    assert_response :success
  end

  test "should get edit" do
    get edit_conducteur_line_position_url(@conducteur_line_position)
    assert_response :success
  end

  test "should update conducteur_line_position" do
    patch conducteur_line_position_url(@conducteur_line_position), params: { conducteur_line_position: { conducteurline_id_id: @conducteur_line_position.conducteurline_id_id, coord_x: @conducteur_line_position.coord_x, coord_y: @conducteur_line_position.coord_y, materiel_id: @conducteur_line_position.materiel_id, transition_type: @conducteur_line_position.transition_type } }
    assert_redirected_to conducteur_line_position_url(@conducteur_line_position)
  end

  test "should destroy conducteur_line_position" do
    assert_difference("ConducteurLinePosition.count", -1) do
      delete conducteur_line_position_url(@conducteur_line_position)
    end

    assert_redirected_to conducteur_line_positions_url
  end
end
