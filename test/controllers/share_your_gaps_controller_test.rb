require "test_helper"

class ShareYourGapsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @share_your_gap = share_your_gaps(:one)
  end

  test "should get index" do
    get share_your_gaps_url
    assert_response :success
  end

  test "should get new" do
    get new_share_your_gap_url
    assert_response :success
  end

  test "should create share_your_gap" do
    assert_difference("ShareYourGap.count") do
      post share_your_gaps_url, params: { share_your_gap: { analysis: @share_your_gap.analysis, conducteur_id: @share_your_gap.conducteur_id, interpretation: @share_your_gap.interpretation, response: @share_your_gap.response } }
    end

    assert_redirected_to share_your_gap_url(ShareYourGap.last)
  end

  test "should show share_your_gap" do
    get share_your_gap_url(@share_your_gap)
    assert_response :success
  end

  test "should get edit" do
    get edit_share_your_gap_url(@share_your_gap)
    assert_response :success
  end

  test "should update share_your_gap" do
    patch share_your_gap_url(@share_your_gap), params: { share_your_gap: { analysis: @share_your_gap.analysis, conducteur_id: @share_your_gap.conducteur_id, interpretation: @share_your_gap.interpretation, response: @share_your_gap.response } }
    assert_redirected_to share_your_gap_url(@share_your_gap)
  end

  test "should destroy share_your_gap" do
    assert_difference("ShareYourGap.count", -1) do
      delete share_your_gap_url(@share_your_gap)
    end

    assert_redirected_to share_your_gaps_url
  end
end
