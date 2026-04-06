require "test_helper"

class InspirationResourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inspiration_resource = inspiration_resources(:one)
  end

  test "should get index" do
    get inspiration_resources_url
    assert_response :success
  end

  test "should get new" do
    get new_inspiration_resource_url
    assert_response :success
  end

  test "should create inspiration_resource" do
    assert_difference("InspirationResource.count") do
      post inspiration_resources_url, params: { inspiration_resource: { category: @inspiration_resource.category, title: @inspiration_resource.title, url: @inspiration_resource.url } }
    end

    assert_redirected_to inspiration_resource_url(InspirationResource.last)
  end

  test "should show inspiration_resource" do
    get inspiration_resource_url(@inspiration_resource)
    assert_response :success
  end

  test "should get edit" do
    get edit_inspiration_resource_url(@inspiration_resource)
    assert_response :success
  end

  test "should update inspiration_resource" do
    patch inspiration_resource_url(@inspiration_resource), params: { inspiration_resource: { category: @inspiration_resource.category, title: @inspiration_resource.title, url: @inspiration_resource.url } }
    assert_redirected_to inspiration_resource_url(@inspiration_resource)
  end

  test "should destroy inspiration_resource" do
    assert_difference("InspirationResource.count", -1) do
      delete inspiration_resource_url(@inspiration_resource)
    end

    assert_redirected_to inspiration_resources_url
  end
end
