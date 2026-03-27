require "test_helper"

class ConducteurlinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @conducteurline = conducteurlines(:one)
  end

  test "should get index" do
    get conducteurlines_url
    assert_response :success
  end

  test "should get new" do
    get new_conducteurline_url
    assert_response :success
  end

  test "should create conducteurline" do
    assert_difference("Conducteurline.count") do
      post conducteurlines_url, params: { conducteurline: { conducteur_id: @conducteurline.conducteur_id, duree: @conducteurline.duree, interpretes: @conducteurline.interpretes, lumieres_ambiante: @conducteurline.lumieres_ambiante, lumieres_effet: @conducteurline.lumieres_effet, machine_brouillard: @conducteurline.machine_brouillard, notes_technicien: @conducteurline.notes_technicien, sequenceaction: @conducteurline.sequenceaction, videoprojection: @conducteurline.videoprojection } }
    end

    assert_redirected_to conducteurline_url(Conducteurline.last)
  end

  test "should show conducteurline" do
    get conducteurline_url(@conducteurline)
    assert_response :success
  end

  test "should get edit" do
    get edit_conducteurline_url(@conducteurline)
    assert_response :success
  end

  test "should update conducteurline" do
    patch conducteurline_url(@conducteurline), params: { conducteurline: { conducteur_id: @conducteurline.conducteur_id, duree: @conducteurline.duree, interpretes: @conducteurline.interpretes, lumieres_ambiante: @conducteurline.lumieres_ambiante, lumieres_effet: @conducteurline.lumieres_effet, machine_brouillard: @conducteurline.machine_brouillard, notes_technicien: @conducteurline.notes_technicien, sequenceaction: @conducteurline.sequenceaction, videoprojection: @conducteurline.videoprojection } }
    assert_redirected_to conducteurline_url(@conducteurline)
  end

  test "should destroy conducteurline" do
    assert_difference("Conducteurline.count", -1) do
      delete conducteurline_url(@conducteurline)
    end

    assert_redirected_to conducteurlines_url
  end
end
