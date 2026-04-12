require "application_system_test_case"

class ArtisticNotesTest < ApplicationSystemTestCase
  setup do
    @artistic_note = artistic_notes(:one)
  end

  test "visiting the index" do
    visit artistic_notes_url
    assert_selector "h1", text: "Artistic notes"
  end

  test "should create artistic note" do
    visit artistic_notes_url
    click_on "New artistic note"

    fill_in "Content", with: @artistic_note.content
    fill_in "Title", with: @artistic_note.title
    click_on "Create Artistic note"

    assert_text "Artistic note was successfully created"
    click_on "Back"
  end

  test "should update Artistic note" do
    visit artistic_note_url(@artistic_note)
    click_on "Edit this artistic note", match: :first

    fill_in "Content", with: @artistic_note.content
    fill_in "Title", with: @artistic_note.title
    click_on "Update Artistic note"

    assert_text "Artistic note was successfully updated"
    click_on "Back"
  end

  test "should destroy Artistic note" do
    visit artistic_note_url(@artistic_note)
    click_on "Destroy this artistic note", match: :first

    assert_text "Artistic note was successfully destroyed"
  end
end
