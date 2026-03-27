require "test_helper"

class ConducteursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @conducteur = conducteurs(:one)
  end

  test "should get index" do
    get conducteurs_url
    assert_response :success
  end

  test "should get new" do
    get new_conducteur_url
    assert_response :success
  end

  test "should create conducteur" do
    assert_difference("Conducteur.count") do
      post conducteurs_url, params: { conducteur: { title: @conducteur.title, username: @conducteur.username } }
    end

    assert_redirected_to conducteur_url(Conducteur.last)
  end

  test "should show conducteur" do
    get conducteur_url(@conducteur)
    assert_response :success
  end

  test "should get edit" do
    get edit_conducteur_url(@conducteur)
    assert_response :success
  end

  test "should update conducteur" do
    patch conducteur_url(@conducteur), params: { conducteur: { title: @conducteur.title, username: @conducteur.username } }
    assert_redirected_to conducteur_url(@conducteur)
  end

  test "should destroy conducteur" do
    assert_difference("Conducteur.count", -1) do
      delete conducteur_url(@conducteur)
    end

    assert_redirected_to conducteurs_url
  end
end
