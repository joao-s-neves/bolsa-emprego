require 'test_helper'

class CompaniesSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'Company.count' do
      post companies_path, params: { company: { nome: "", email: "company@example",
                                                   password: "foo", password_confirmation: "fbar",
                                                   morada: "Rua X", cpostal: "0000-000",  localidade: "Porto",
                                                   contacto: "911111111",  pagina: "exemplo.com",  nif:"11111111",
                                                   atividade_profissional: "teste", apresentacao: "lorem ipsum" } }
    end
    assert_template 'companies/new'
    #assert_select 'div#error_explanation'
    #assert_select 'div.field_with_errors'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'Company.count', 1 do
      post companies_path, params: { company: { nome: "Example Company", email: "company@example.com",
                                                   password: "password", password_confirmation: "password",
                                                   morada: "Rua X", cpostal: "0000-000",  localidade: "Porto",
                                                   contacto: "911111111",  pagina: "exemplo.com",  nif:"11111111",
                                                   atividade_profissional: "teste", apresentacao: "lorem ipsum" } }
    follow_redirect!
    assert_template 'companies/show'
    assert_not flash.empty?
  end
end
end
