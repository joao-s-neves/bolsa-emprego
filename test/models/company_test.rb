require 'test_helper'

class ComapnyTest < ActiveSupport::TestCase

  def setup
    @company = Company.new(#nome: "Example Company", email: "company@example.com",
                                                   #password: "foobar", password_confirmation: "foobar",
                                                   #morada: "Rua X", cpostal: "0000-000",  localidade: "Porto",
                                                   #contacto: "911111111",  pagina: "exemplo.com",
                                                   nif:"11111111", atividade_profissional: "teste")
  end

  test "should be valid" do
    assert @company.valid?
  end

  test "nif should be present" do
    @company.nif = "     "
    assert_not @company.valid?
  end

  test "professional activity should be present" do
    @company.atividade_profissional = "     "
    assert_not @company.valid?
  end
end
