require "test_helper"

class ArtisticNotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @artistic_note = artistic_notes(:one)
  end

  test "should get index" do
    get artistic_notes_url
    assert_response :success
  end

  test "should get new" do
    get new_artistic_note_url
    assert_response :success
  end

  test "should create artistic_note" do
    assert_difference("ArtisticNote.count") do
      post artistic_notes_url, params: { artistic_note: { content: @artistic_note.content, title: @artistic_note.title } }
    end

    assert_redirected_to artistic_note_url(ArtisticNote.last)
  end

  test "should show artistic_note" do
    get artistic_note_url(@artistic_note)
    assert_response :success
  end

  test "should get edit" do
    get edit_artistic_note_url(@artistic_note)
    assert_response :success
  end

  test "should update artistic_note" do
    patch artistic_note_url(@artistic_note), params: { artistic_note: { content: @artistic_note.content, title: @artistic_note.title } }
    assert_redirected_to artistic_note_url(@artistic_note)
  end

  test "should destroy artistic_note" do
    assert_difference("ArtisticNote.count", -1) do
      delete artistic_note_url(@artistic_note)
    end

    assert_redirected_to artistic_notes_url
  end
end
