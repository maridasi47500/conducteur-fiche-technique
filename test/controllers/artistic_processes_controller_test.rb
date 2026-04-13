require "test_helper"

class ArtisticProcessesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @artistic_process = artistic_processes(:one)
  end

  test "should get index" do
    get artistic_processes_url
    assert_response :success
  end

  test "should get new" do
    get new_artistic_process_url
    assert_response :success
  end

  test "should create artistic_process" do
    assert_difference("ArtisticProcess.count") do
      post artistic_processes_url, params: { artistic_process: { breakthrough: @artistic_process.breakthrough, conducteur_id: @artistic_process.conducteur_id, doubts_questions: @artistic_process.doubts_questions, final_form: @artistic_process.final_form, first_attempt: @artistic_process.first_attempt, initial_impulse: @artistic_process.initial_impulse, iteration_count: @artistic_process.iteration_count, rejected_ideas: @artistic_process.rejected_ideas, what_changed: @artistic_process.what_changed } }
    end

    assert_redirected_to artistic_process_url(ArtisticProcess.last)
  end

  test "should show artistic_process" do
    get artistic_process_url(@artistic_process)
    assert_response :success
  end

  test "should get edit" do
    get edit_artistic_process_url(@artistic_process)
    assert_response :success
  end

  test "should update artistic_process" do
    patch artistic_process_url(@artistic_process), params: { artistic_process: { breakthrough: @artistic_process.breakthrough, conducteur_id: @artistic_process.conducteur_id, doubts_questions: @artistic_process.doubts_questions, final_form: @artistic_process.final_form, first_attempt: @artistic_process.first_attempt, initial_impulse: @artistic_process.initial_impulse, iteration_count: @artistic_process.iteration_count, rejected_ideas: @artistic_process.rejected_ideas, what_changed: @artistic_process.what_changed } }
    assert_redirected_to artistic_process_url(@artistic_process)
  end

  test "should destroy artistic_process" do
    assert_difference("ArtisticProcess.count", -1) do
      delete artistic_process_url(@artistic_process)
    end

    assert_redirected_to artistic_processes_url
  end
end
