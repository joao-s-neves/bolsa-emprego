require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { nome: "  ", email: "user@example",
                                   password: "foo", password_confirmation: "bar",
                                   morada: "Rua X", cpostal: "0000-000",  localidade: "Porto",
                                   contacto: "911111111",  pagina: "exemplo.com",  apresentacao: "lorem ipsum", candidate_attributes: [d_nascimento:" ", cartao_cidadao: " ", area_profissional: " ",
                                                                                                        hab_literarias: " ", habilitation_description: " ", situacao: " ", experiencia: " "]} }
    end
    assert_template 'users/new'
    #assert_select 'div#error_explanation'
    #assert_select 'div.field_with_errors'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { nome: " Example User", email: "user@example.com",
                                   password: "password", password_confirmation: "password",
                                   morada: "Rua X", cpostal: "0000-000",  localidade: "Porto",
                                   contacto: "911111111",  pagina: "exemplo.com",  apresentacao: "lorem ipsum", candidate_attributes: [d_nascimento:"11-11-1999", cartao_cidadao: "teste", area_profissional: "teste",
                                                                                                        hab_literarias: "teste", habilitation_description: "teste", situacao: "teste", experiencia: "teste"]} }
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end
end
end
