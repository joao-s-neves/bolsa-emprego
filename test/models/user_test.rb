require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(nome: "Example User", email: "user@example.com",
                                   password: "foobar", password_confirmation: "foobar",
                                   morada: "Rua X", cpostal: "0000-000",  localidade: "Porto",
                                   contacto: "911111111",  pagina: "exemplo.com",   d_nascimento: "14-03-1996",
                                   cartao_cidadao:"11111111", area_profissional: "programador",
                                   apresentacao: "lorem ipsum",  hab_literarias: "secundario",
                                   hab_ds: "lorem ipsum", situacao: "desempregado", experiencia: "lorem ipsum")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.nome = "     "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "address should be present" do
    @user.morada = "     "
    assert_not @user.valid?
  end

  test "zip code should be present" do
    @user.cpostal = "     "
    assert_not @user.valid?
  end

  test "city should be present" do
    @user.localidade = "     "
    assert_not @user.valid?
  end

  test "contact should be present" do
    @user.contacto = "     "
    assert_not @user.valid?
  end

  test "page should be present" do
    @user.pagina = "     "
    assert_not @user.valid?
  end

  test "birth date should be present" do
    @user.d_nascimento = "     "
    assert_not @user.valid?
  end

  test "identity should be present" do
    @user.cartao_cidadao = "     "
    assert_not @user.valid?
  end

  test "professional area activity should be present" do
    @user.area_profissional = "     "
    assert_not @user.valid?
  end

  test "presentation should be present" do
    @user.apresentacao = "     "
    assert_not @user.valid?
  end

  test "qualification level should be present" do
    @user.hab_literarias = "     "
    assert_not @user.valid?
  end

  test "qualification level description should be present" do
    @user.hab_ds = "     "
    assert_not @user.valid?
  end

  test "professional situation should be present" do
    @user.situacao = "     "
    assert_not @user.valid?
  end

  test "experience should be present" do
    @user.experiencia = "     "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.nome = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end