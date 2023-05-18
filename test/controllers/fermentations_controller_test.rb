require "test_helper"

class FermentationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fermentation = fermentations(:one)
  end

  test "should get index" do
    get fermentations_url, as: :json
    assert_response :success
  end

  test "should create fermentation" do
    assert_difference("Fermentation.count") do
      post fermentations_url, params: { fermentation: { campaign: @fermentation.campaign, date: @fermentation.date, level: @fermentation.level, plant: @fermentation.plant, product: @fermentation.product, recieved: @fermentation.recieved, stage: @fermentation.stage, tank: @fermentation.tank, weight: @fermentation.weight } }, as: :json
    end

    assert_response :created
  end

  test "should show fermentation" do
    get fermentation_url(@fermentation), as: :json
    assert_response :success
  end

  test "should update fermentation" do
    patch fermentation_url(@fermentation), params: { fermentation: { campaign: @fermentation.campaign, date: @fermentation.date, level: @fermentation.level, plant: @fermentation.plant, product: @fermentation.product, recieved: @fermentation.recieved, stage: @fermentation.stage, tank: @fermentation.tank, weight: @fermentation.weight } }, as: :json
    assert_response :success
  end

  test "should destroy fermentation" do
    assert_difference("Fermentation.count", -1) do
      delete fermentation_url(@fermentation), as: :json
    end

    assert_response :no_content
  end
end
