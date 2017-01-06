require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Bolsa de Emprego"
  end

  test "should get root" do
    get '/'
    assert_response :success
  end

  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "Home | Bolsa de Emprego"
  end

end
