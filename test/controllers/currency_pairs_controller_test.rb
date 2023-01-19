require "test_helper"

class CurrencyPairsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @currency_pair = currency_pairs(:one)
  end

  test "should get index" do
    get currency_pairs_url
    assert_response :success
  end

  test "should get new" do
    get new_currency_pair_url
    assert_response :success
  end

  test "should create currency_pair" do
    assert_difference('CurrencyPair.count') do
      post currency_pairs_url, params: { currency_pair: { base_currency_id: @currency_pair.base_currency_id, compare_rate: @currency_pair.compare_rate, compared_at: @currency_pair.compared_at, compared_currency_id: @currency_pair.compared_currency_id } }
    end

    assert_redirected_to currency_pair_url(CurrencyPair.last)
  end

  test "should show currency_pair" do
    get currency_pair_url(@currency_pair)
    assert_response :success
  end

  test "should get edit" do
    get edit_currency_pair_url(@currency_pair)
    assert_response :success
  end

  test "should update currency_pair" do
    patch currency_pair_url(@currency_pair), params: { currency_pair: { base_currency_id: @currency_pair.base_currency_id, compare_rate: @currency_pair.compare_rate, compared_at: @currency_pair.compared_at, compared_currency_id: @currency_pair.compared_currency_id } }
    assert_redirected_to currency_pair_url(@currency_pair)
  end

  test "should destroy currency_pair" do
    assert_difference('CurrencyPair.count', -1) do
      delete currency_pair_url(@currency_pair)
    end

    assert_redirected_to currency_pairs_url
  end
end
