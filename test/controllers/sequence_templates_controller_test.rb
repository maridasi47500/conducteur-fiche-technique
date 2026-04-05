require "test_helper"

class SequenceTemplatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sequence_template = sequence_templates(:one)
  end

  test "should get index" do
    get sequence_templates_url
    assert_response :success
  end

  test "should get new" do
    get new_sequence_template_url
    assert_response :success
  end

  test "should create sequence_template" do
    assert_difference("SequenceTemplate.count") do
      post sequence_templates_url, params: { sequence_template: { intensity: @sequence_template.intensity, label: @sequence_template.label, phase: @sequence_template.phase, suggested_light: @sequence_template.suggested_light, target_talent: @sequence_template.target_talent } }
    end

    assert_redirected_to sequence_template_url(SequenceTemplate.last)
  end

  test "should show sequence_template" do
    get sequence_template_url(@sequence_template)
    assert_response :success
  end

  test "should get edit" do
    get edit_sequence_template_url(@sequence_template)
    assert_response :success
  end

  test "should update sequence_template" do
    patch sequence_template_url(@sequence_template), params: { sequence_template: { intensity: @sequence_template.intensity, label: @sequence_template.label, phase: @sequence_template.phase, suggested_light: @sequence_template.suggested_light, target_talent: @sequence_template.target_talent } }
    assert_redirected_to sequence_template_url(@sequence_template)
  end

  test "should destroy sequence_template" do
    assert_difference("SequenceTemplate.count", -1) do
      delete sequence_template_url(@sequence_template)
    end

    assert_redirected_to sequence_templates_url
  end
end
