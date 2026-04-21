require "test_helper"

class MachineLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @machine_log = machine_logs(:one)
  end

  test "should get index" do
    get machine_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_machine_log_url
    assert_response :success
  end

  test "should create machine_log" do
    assert_difference("MachineLog.count") do
      post machine_logs_url, params: { machine_log: { fb_translation: @machine_log.fb_translation, human_perspective: @machine_log.human_perspective, level: @machine_log.level, module: @machine_log.module, raw_data: @machine_log.raw_data } }
    end

    assert_redirected_to machine_log_url(MachineLog.last)
  end

  test "should show machine_log" do
    get machine_log_url(@machine_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_machine_log_url(@machine_log)
    assert_response :success
  end

  test "should update machine_log" do
    patch machine_log_url(@machine_log), params: { machine_log: { fb_translation: @machine_log.fb_translation, human_perspective: @machine_log.human_perspective, level: @machine_log.level, module: @machine_log.module, raw_data: @machine_log.raw_data } }
    assert_redirected_to machine_log_url(@machine_log)
  end

  test "should destroy machine_log" do
    assert_difference("MachineLog.count", -1) do
      delete machine_log_url(@machine_log)
    end

    assert_redirected_to machine_logs_url
  end
end
