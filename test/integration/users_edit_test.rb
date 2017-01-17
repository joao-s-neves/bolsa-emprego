require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:neves)
  end

  test "unsuccessful edit" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name: " ", email: "user@example",
                                                                      address: " ", zip_code: " ",  city: " ",
                                                                      contact: " ",  page: " ",  presentation: " ", candidate_attributes: [d_nascimento:" ", cartao_cidadao: " ", area_profissional: " ",
                                                                                                        hab_literarias: " ", habilitation_description: " ", situacao: " ", experiencia: " "] } }

    assert_template 'users/edit'
  end
end
