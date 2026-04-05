require "test_helper"

class AmbianceOptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ambiance_option = ambiance_options(:one)
  end

  test "should get index" do
    get ambiance_options_url
    assert_response :success
  end

  test "should get new" do
    get new_ambiance_option_url
    assert_response :success
  end

  test "should create ambiance_option" do
    assert_difference("AmbianceOption.count") do
      post ambiance_options_url, params: { ambiance_option: { category: @ambiance_option.category, style_id: @ambiance_option.style_id, value: @ambiance_option.value } }
    end

    assert_redirected_to ambiance_option_url(AmbianceOption.last)
  end

  test "should show ambiance_option" do
    get ambiance_option_url(@ambiance_option)
    assert_response :success
  end

  test "should get edit" do
    get edit_ambiance_option_url(@ambiance_option)
    assert_response :success
  end

  test "should update ambiance_option" do
    patch ambiance_option_url(@ambiance_option), params: { ambiance_option: { category: @ambiance_option.category, style_id: @ambiance_option.style_id, value: @ambiance_option.value } }
    assert_redirected_to ambiance_option_url(@ambiance_option)
  end

  test "should destroy ambiance_option" do
    assert_difference("AmbianceOption.count", -1) do
      delete ambiance_option_url(@ambiance_option)
    end

    assert_redirected_to ambiance_options_url
  end
end
