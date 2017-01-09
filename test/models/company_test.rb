require 'test_helper'

class ComapnyTest < ActiveSupport::TestCase

  def setup
    @company = Company.new(nome: "Example Company", email: "company@example.com",
                                                   password: "foobar", password_confirmation: "foobar",
                                                   morada: "Rua X", cpostal: "0000-000",  localidade: "Porto",
                                                   contacto: "911111111",  pagina: "exemplo.com",  nif:"11111111",
                                                   atividade_profissional: "teste", apresentacao: "lorem ipsum")
  end

  test "should be valid" do
    assert @company.valid?
  end

  test "name should be present" do
    @company.nome = "     "
    assert_not @company.valid?
  end

  test "email should be present" do
    @company.email = "     "
    assert_not @company.valid?
  end

  test "address should be present" do
    @company.morada = "     "
    assert_not @company.valid?
  end

  test "zip code should be present" do
    @company.cpostal = "     "
    assert_not @company.valid?
  end

  test "city should be present" do
    @company.localidade = "     "
    assert_not @company.valid?
  end

  test "contact should be present" do
    @company.contacto = "     "
    assert_not @company.valid?
  end

  test "page should be present" do
    @company.pagina = "     "
    assert_not @company.valid?
  end

  test "nif should be present" do
    @company.nif = "     "
    assert_not @company.valid?
  end

  test "professional activity should be present" do
    @company.atividade_profissional = "     "
    assert_not @company.valid?
  end

  test "presentation should be present" do
    @company.apresentacao = "     "
    assert_not @company.valid?
  end

  test "name should not be too long" do
    @company.nome = "a" * 51
    assert_not @company.valid?
  end

  test "email should not be too long" do
    @company.email = "a" * 244 + "@example.com"
    assert_not @company.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @company.email = valid_address
      assert @company.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @company.email = invalid_address
      assert_not @company.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_company = @company.dup
    duplicate_company.email = @company.email.upcase
    @company.save
    assert_not duplicate_company.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @company.email = mixed_case_email
    @company.save
    assert_equal mixed_case_email.downcase, @company.reload.email
  end

  test "password should be present (nonblank)" do
    @company.password = @company.password_confirmation = " " * 6
    assert_not @company.valid?
  end

  test "password should have a minimum length" do
    @company.password = @company.password_confirmation = "a" * 5
    assert_not @company.valid?
  end
end
