require "application_system_test_case"

class CurrencyPairsTest < ApplicationSystemTestCase
  setup do
    @currency_pair = currency_pairs(:one)
  end

  test "visiting the index" do
    visit currency_pairs_url
    assert_selector "h1", text: "Currency Pairs"
  end

  test "creating a Currency pair" do
    visit currency_pairs_url
    click_on "New Currency Pair"

    fill_in "Base currency", with: @currency_pair.base_currency_id
    fill_in "Compare rate", with: @currency_pair.compare_rate
    fill_in "Compared at", with: @currency_pair.compared_at
    fill_in "Compared currency", with: @currency_pair.compared_currency_id
    click_on "Create Currency pair"

    assert_text "Currency pair was successfully created"
    click_on "Back"
  end

  test "updating a Currency pair" do
    visit currency_pairs_url
    click_on "Edit", match: :first

    fill_in "Base currency", with: @currency_pair.base_currency_id
    fill_in "Compare rate", with: @currency_pair.compare_rate
    fill_in "Compared at", with: @currency_pair.compared_at
    fill_in "Compared currency", with: @currency_pair.compared_currency_id
    click_on "Update Currency pair"

    assert_text "Currency pair was successfully updated"
    click_on "Back"
  end

  test "destroying a Currency pair" do
    visit currency_pairs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Currency pair was successfully destroyed"
  end
end
