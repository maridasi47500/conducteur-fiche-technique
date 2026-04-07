require "test_helper"

class EmotionalMarkersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @emotional_marker = emotional_markers(:one)
  end

  test "should get index" do
    get emotional_markers_url
    assert_response :success
  end

  test "should get new" do
    get new_emotional_marker_url
    assert_response :success
  end

  test "should create emotional_marker" do
    assert_difference("EmotionalMarker.count") do
      post emotional_markers_url, params: { emotional_marker: { name: @emotional_marker.name } }
    end

    assert_redirected_to emotional_marker_url(EmotionalMarker.last)
  end

  test "should show emotional_marker" do
    get emotional_marker_url(@emotional_marker)
    assert_response :success
  end

  test "should get edit" do
    get edit_emotional_marker_url(@emotional_marker)
    assert_response :success
  end

  test "should update emotional_marker" do
    patch emotional_marker_url(@emotional_marker), params: { emotional_marker: { name: @emotional_marker.name } }
    assert_redirected_to emotional_marker_url(@emotional_marker)
  end

  test "should destroy emotional_marker" do
    assert_difference("EmotionalMarker.count", -1) do
      delete emotional_marker_url(@emotional_marker)
    end

    assert_redirected_to emotional_markers_url
  end
end
