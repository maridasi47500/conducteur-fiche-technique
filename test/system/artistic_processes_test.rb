require "application_system_test_case"

class ArtisticProcessesTest < ApplicationSystemTestCase
  setup do
    @artistic_process = artistic_processes(:one)
  end

  test "visiting the index" do
    visit artistic_processes_url
    assert_selector "h1", text: "Artistic processes"
  end

  test "should create artistic process" do
    visit artistic_processes_url
    click_on "New artistic process"

    fill_in "Breakthrough", with: @artistic_process.breakthrough
    fill_in "Conducteur", with: @artistic_process.conducteur_id
    fill_in "Doubts questions", with: @artistic_process.doubts_questions
    fill_in "Final form", with: @artistic_process.final_form
    fill_in "First attempt", with: @artistic_process.first_attempt
    fill_in "Initial impulse", with: @artistic_process.initial_impulse
    fill_in "Iteration count", with: @artistic_process.iteration_count
    fill_in "Rejected ideas", with: @artistic_process.rejected_ideas
    fill_in "What changed", with: @artistic_process.what_changed
    click_on "Create Artistic process"

    assert_text "Artistic process was successfully created"
    click_on "Back"
  end

  test "should update Artistic process" do
    visit artistic_process_url(@artistic_process)
    click_on "Edit this artistic process", match: :first

    fill_in "Breakthrough", with: @artistic_process.breakthrough
    fill_in "Conducteur", with: @artistic_process.conducteur_id
    fill_in "Doubts questions", with: @artistic_process.doubts_questions
    fill_in "Final form", with: @artistic_process.final_form
    fill_in "First attempt", with: @artistic_process.first_attempt
    fill_in "Initial impulse", with: @artistic_process.initial_impulse
    fill_in "Iteration count", with: @artistic_process.iteration_count
    fill_in "Rejected ideas", with: @artistic_process.rejected_ideas
    fill_in "What changed", with: @artistic_process.what_changed
    click_on "Update Artistic process"

    assert_text "Artistic process was successfully updated"
    click_on "Back"
  end

  test "should destroy Artistic process" do
    visit artistic_process_url(@artistic_process)
    click_on "Destroy this artistic process", match: :first

    assert_text "Artistic process was successfully destroyed"
  end
end
