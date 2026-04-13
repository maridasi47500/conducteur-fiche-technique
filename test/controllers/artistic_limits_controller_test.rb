require "test_helper"

class ArtisticLimitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @artistic_limit = artistic_limits(:one)
  end

  test "should get index" do
    get artistic_limits_url
    assert_response :success
  end

  test "should get new" do
    get new_artistic_limit_url
    assert_response :success
  end

  test "should create artistic_limit" do
    assert_difference("ArtisticLimit.count") do
      post artistic_limits_url, params: { artistic_limit: { conducteur_id: @artistic_limit.conducteur_id, contradiction: @artistic_limit.contradiction, emotional_truth: @artistic_limit.emotional_truth, left_unintentional: @artistic_limit.left_unintentional, what_i_want: @artistic_limit.what_i_want, why_untranslatable: @artistic_limit.why_untranslatable } }
    end

    assert_redirected_to artistic_limit_url(ArtisticLimit.last)
  end

  test "should show artistic_limit" do
    get artistic_limit_url(@artistic_limit)
    assert_response :success
  end

  test "should get edit" do
    get edit_artistic_limit_url(@artistic_limit)
    assert_response :success
  end

  test "should update artistic_limit" do
    patch artistic_limit_url(@artistic_limit), params: { artistic_limit: { conducteur_id: @artistic_limit.conducteur_id, contradiction: @artistic_limit.contradiction, emotional_truth: @artistic_limit.emotional_truth, left_unintentional: @artistic_limit.left_unintentional, what_i_want: @artistic_limit.what_i_want, why_untranslatable: @artistic_limit.why_untranslatable } }
    assert_redirected_to artistic_limit_url(@artistic_limit)
  end

  test "should destroy artistic_limit" do
    assert_difference("ArtisticLimit.count", -1) do
      delete artistic_limit_url(@artistic_limit)
    end

    assert_redirected_to artistic_limits_url
  end
end
