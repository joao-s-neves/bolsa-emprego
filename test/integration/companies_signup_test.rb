require 'test_helper'

class CompaniesSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'Company.count' do
      post companies_path, params: { company: {  nif: "111111", atividade_profissional: "teste"} }
    end
    assert_template 'companies/new'
    #assert_select 'div#error_explanation'
    #assert_select 'div.field_with_errors'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'Company.count', 1 do
      post companies_path, params: { company: { nif: "111111", atividade_profissional: "teste" } }
    follow_redirect!
    assert_template 'companies/show'
    assert_not flash.empty?
  end
end
end
