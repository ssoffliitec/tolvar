require 'test_helper'

class BudgetDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @budget_detail = budget_details(:one)
  end

  test "should get index" do
    get budget_details_url
    assert_response :success
  end

  test "should get new" do
    get new_budget_detail_url
    assert_response :success
  end

  test "should create budget_detail" do
    assert_difference('BudgetDetail.count') do
      post budget_details_url, params: { budget_detail: { item_id: @budget_detail.item_id, number: @budget_detail.number, price: @budget_detail.price, qty: @budget_detail.qty, sale_id: @budget_detail.sale_id } }
    end

    assert_redirected_to budget_detail_url(BudgetDetail.last)
  end

  test "should show budget_detail" do
    get budget_detail_url(@budget_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_budget_detail_url(@budget_detail)
    assert_response :success
  end

  test "should update budget_detail" do
    patch budget_detail_url(@budget_detail), params: { budget_detail: { item_id: @budget_detail.item_id, number: @budget_detail.number, price: @budget_detail.price, qty: @budget_detail.qty, sale_id: @budget_detail.sale_id } }
    assert_redirected_to budget_detail_url(@budget_detail)
  end

  test "should destroy budget_detail" do
    assert_difference('BudgetDetail.count', -1) do
      delete budget_detail_url(@budget_detail)
    end

    assert_redirected_to budget_details_url
  end
end
