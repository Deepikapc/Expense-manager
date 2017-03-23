require 'test_helper'

class ExpenseManagerControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get expense_manager_dashboard_url
    assert_response :success
  end

end
