require "application_system_test_case"

class MachineLogsTest < ApplicationSystemTestCase
  setup do
    @machine_log = machine_logs(:one)
  end

  test "visiting the index" do
    visit machine_logs_url
    assert_selector "h1", text: "Machine logs"
  end

  test "should create machine log" do
    visit machine_logs_url
    click_on "New machine log"

    fill_in "Fb translation", with: @machine_log.fb_translation
    fill_in "Human perspective", with: @machine_log.human_perspective
    fill_in "Level", with: @machine_log.level
    fill_in "Module", with: @machine_log.module
    fill_in "Raw data", with: @machine_log.raw_data
    click_on "Create Machine log"

    assert_text "Machine log was successfully created"
    click_on "Back"
  end

  test "should update Machine log" do
    visit machine_log_url(@machine_log)
    click_on "Edit this machine log", match: :first

    fill_in "Fb translation", with: @machine_log.fb_translation
    fill_in "Human perspective", with: @machine_log.human_perspective
    fill_in "Level", with: @machine_log.level
    fill_in "Module", with: @machine_log.module
    fill_in "Raw data", with: @machine_log.raw_data
    click_on "Update Machine log"

    assert_text "Machine log was successfully updated"
    click_on "Back"
  end

  test "should destroy Machine log" do
    visit machine_log_url(@machine_log)
    click_on "Destroy this machine log", match: :first

    assert_text "Machine log was successfully destroyed"
  end
end
