require "test_helper"

class CreativeDetoursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @creative_detour = creative_detours(:one)
  end

  test "should get index" do
    get creative_detours_url
    assert_response :success
  end

  test "should get new" do
    get new_creative_detour_url
    assert_response :success
  end

  test "should create creative_detour" do
    assert_difference("CreativeDetour.count") do
      post creative_detours_url, params: { creative_detour: { action: @creative_detour.action, challenge: @creative_detour.challenge, concept: @creative_detour.concept, database_usage: @creative_detour.database_usage, reaction: @creative_detour.reaction, storage_impact: @creative_detour.storage_impact, title: @creative_detour.title } }
    end

    assert_redirected_to creative_detour_url(CreativeDetour.last)
  end

  test "should show creative_detour" do
    get creative_detour_url(@creative_detour)
    assert_response :success
  end

  test "should get edit" do
    get edit_creative_detour_url(@creative_detour)
    assert_response :success
  end

  test "should update creative_detour" do
    patch creative_detour_url(@creative_detour), params: { creative_detour: { action: @creative_detour.action, challenge: @creative_detour.challenge, concept: @creative_detour.concept, database_usage: @creative_detour.database_usage, reaction: @creative_detour.reaction, storage_impact: @creative_detour.storage_impact, title: @creative_detour.title } }
    assert_redirected_to creative_detour_url(@creative_detour)
  end

  test "should destroy creative_detour" do
    assert_difference("CreativeDetour.count", -1) do
      delete creative_detour_url(@creative_detour)
    end

    assert_redirected_to creative_detours_url
  end
end
