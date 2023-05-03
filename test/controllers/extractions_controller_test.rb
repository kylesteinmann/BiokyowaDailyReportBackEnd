require "test_helper"

class ExtractionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @extraction = extractions(:one)
  end

  test "should get index" do
    get extractions_url, as: :json
    assert_response :success
  end

  test "should create extraction" do
    assert_difference("Extraction.count") do
      post extractions_url, params: { extraction: { campaign: @extraction.campaign, concentration: @extraction.concentration, date: @extraction.date, level_indicator: @extraction.level_indicator, ph_level: @extraction.ph_level, product: @extraction.product, stage: @extraction.stage, tank: @extraction.tank, volume: @extraction.volume, weight: @extraction.weight } }, as: :json
    end

    assert_response :created
  end

  test "should show extraction" do
    get extraction_url(@extraction), as: :json
    assert_response :success
  end

  test "should update extraction" do
    patch extraction_url(@extraction), params: { extraction: { campaign: @extraction.campaign, concentration: @extraction.concentration, date: @extraction.date, level_indicator: @extraction.level_indicator, ph_level: @extraction.ph_level, product: @extraction.product, stage: @extraction.stage, tank: @extraction.tank, volume: @extraction.volume, weight: @extraction.weight } }, as: :json
    assert_response :success
  end

  test "should destroy extraction" do
    assert_difference("Extraction.count", -1) do
      delete extraction_url(@extraction), as: :json
    end

    assert_response :no_content
  end
end
