require "test_helper"

class ProjetArtistiquesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @projet_artistique = projet_artistiques(:one)
  end

  test "should get index" do
    get projet_artistiques_url
    assert_response :success
  end

  test "should get new" do
    get new_projet_artistique_url
    assert_response :success
  end

  test "should create projet_artistique" do
    assert_difference("ProjetArtistique.count") do
      post projet_artistiques_url, params: { projet_artistique: { conducteur_id: @projet_artistique.conducteur_id, fiche_technique_id: @projet_artistique.fiche_technique_id, title: @projet_artistique.title, username: @projet_artistique.username } }
    end

    assert_redirected_to projet_artistique_url(ProjetArtistique.last)
  end

  test "should show projet_artistique" do
    get projet_artistique_url(@projet_artistique)
    assert_response :success
  end

  test "should get edit" do
    get edit_projet_artistique_url(@projet_artistique)
    assert_response :success
  end

  test "should update projet_artistique" do
    patch projet_artistique_url(@projet_artistique), params: { projet_artistique: { conducteur_id: @projet_artistique.conducteur_id, fiche_technique_id: @projet_artistique.fiche_technique_id, title: @projet_artistique.title, username: @projet_artistique.username } }
    assert_redirected_to projet_artistique_url(@projet_artistique)
  end

  test "should destroy projet_artistique" do
    assert_difference("ProjetArtistique.count", -1) do
      delete projet_artistique_url(@projet_artistique)
    end

    assert_redirected_to projet_artistiques_url
  end
end
