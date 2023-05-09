require "test_helper"

class PackagingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @packaging = packagings(:one)
  end

  test "should get index" do
    get packagings_url, as: :json
    assert_response :success
  end

  test "should create packaging" do
    assert_difference("Packaging.count") do
      post packagings_url, params: { packaging: { campaign: @packaging.campaign, date: @packaging.date, incoming: @packaging.incoming, outgoing: @packaging.outgoing, package: @packaging.package, plant: @packaging.plant, product: @packaging.product } }, as: :json
    end

    assert_response :created
  end

  test "should show packaging" do
    get packaging_url(@packaging), as: :json
    assert_response :success
  end

  test "should update packaging" do
    patch packaging_url(@packaging), params: { packaging: { campaign: @packaging.campaign, date: @packaging.date, incoming: @packaging.incoming, outgoing: @packaging.outgoing, package: @packaging.package, plant: @packaging.plant, product: @packaging.product } }, as: :json
    assert_response :success
  end

  test "should destroy packaging" do
    assert_difference("Packaging.count", -1) do
      delete packaging_url(@packaging), as: :json
    end

    assert_response :no_content
  end
end
