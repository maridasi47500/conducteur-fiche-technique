require "application_system_test_case"

class InspirationResourcesTest < ApplicationSystemTestCase
  setup do
    @inspiration_resource = inspiration_resources(:one)
  end

  test "visiting the index" do
    visit inspiration_resources_url
    assert_selector "h1", text: "Inspiration resources"
  end

  test "should create inspiration resource" do
    visit inspiration_resources_url
    click_on "New inspiration resource"

    fill_in "Category", with: @inspiration_resource.category
    fill_in "Title", with: @inspiration_resource.title
    fill_in "Url", with: @inspiration_resource.url
    click_on "Create Inspiration resource"

    assert_text "Inspiration resource was successfully created"
    click_on "Back"
  end

  test "should update Inspiration resource" do
    visit inspiration_resource_url(@inspiration_resource)
    click_on "Edit this inspiration resource", match: :first

    fill_in "Category", with: @inspiration_resource.category
    fill_in "Title", with: @inspiration_resource.title
    fill_in "Url", with: @inspiration_resource.url
    click_on "Update Inspiration resource"

    assert_text "Inspiration resource was successfully updated"
    click_on "Back"
  end

  test "should destroy Inspiration resource" do
    visit inspiration_resource_url(@inspiration_resource)
    click_on "Destroy this inspiration resource", match: :first

    assert_text "Inspiration resource was successfully destroyed"
  end
end
