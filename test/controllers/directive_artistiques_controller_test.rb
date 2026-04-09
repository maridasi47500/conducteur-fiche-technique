require "test_helper"

class DirectiveArtistiquesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @directive_artistique = directive_artistiques(:one)
  end

  test "should get index" do
    get directive_artistiques_url
    assert_response :success
  end

  test "should get new" do
    get new_directive_artistique_url
    assert_response :success
  end

  test "should create directive_artistique" do
    assert_difference("DirectiveArtistique.count") do
      post directive_artistiques_url, params: { directive_artistique: { default_duree: @directive_artistique.default_duree, default_interpretes: @directive_artistique.default_interpretes, default_lumieres_ambiante: @directive_artistique.default_lumieres_ambiante, default_lumieres_effet: @directive_artistique.default_lumieres_effet, default_notes_technicien: @directive_artistique.default_notes_technicien, default_sequenceaction: @directive_artistique.default_sequenceaction, default_son: @directive_artistique.default_son, default_videoprojection: @directive_artistique.default_videoprojection, name: @directive_artistique.name, stage_theme_id: @directive_artistique.stage_theme_id } }
    end

    assert_redirected_to directive_artistique_url(DirectiveArtistique.last)
  end

  test "should show directive_artistique" do
    get directive_artistique_url(@directive_artistique)
    assert_response :success
  end

  test "should get edit" do
    get edit_directive_artistique_url(@directive_artistique)
    assert_response :success
  end

  test "should update directive_artistique" do
    patch directive_artistique_url(@directive_artistique), params: { directive_artistique: { default_duree: @directive_artistique.default_duree, default_interpretes: @directive_artistique.default_interpretes, default_lumieres_ambiante: @directive_artistique.default_lumieres_ambiante, default_lumieres_effet: @directive_artistique.default_lumieres_effet, default_notes_technicien: @directive_artistique.default_notes_technicien, default_sequenceaction: @directive_artistique.default_sequenceaction, default_son: @directive_artistique.default_son, default_videoprojection: @directive_artistique.default_videoprojection, name: @directive_artistique.name, stage_theme_id: @directive_artistique.stage_theme_id } }
    assert_redirected_to directive_artistique_url(@directive_artistique)
  end

  test "should destroy directive_artistique" do
    assert_difference("DirectiveArtistique.count", -1) do
      delete directive_artistique_url(@directive_artistique)
    end

    assert_redirected_to directive_artistiques_url
  end
end
