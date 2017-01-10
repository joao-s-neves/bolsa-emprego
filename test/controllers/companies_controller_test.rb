require 'test_helper'

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get signup_e_path
    assert_response :success
  end

end
