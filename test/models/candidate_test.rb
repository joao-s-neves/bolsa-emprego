require 'test_helper'

class CandidateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @candidate = Candidate.new(d_nascimento: "14-03-1996", cartao_cidadao:"11111111",
                                   area_profissional: "programador", hab_literarias: "secundario",
                                   habilitation_description: "lorem ipsum", situacao: "desempregado", experiencia: "lorem ipsum")
  end

  test "birth date should be present" do
    @candidate.d_nascimento = "     "
    assert_not @candidate.valid?
  end

  test "identity should be present" do
    @candidate.cartao_cidadao = "     "
    assert_not @candidate.valid?
  end

  test "professional area activity should be present" do
    @candidate.area_profissional = "     "
    assert_not @candidate.valid?
  end

  test "qualification level should be present" do
    @candidate.hab_literarias = "     "
    assert_not @candidate.valid?
  end

  test "qualification level description should be present" do
    @candidate.habilitation_description = "     "
    assert_not @candidate.valid?
  end

  test "professional situation should be present" do
    @candidate.situacao = "     "
    assert_not @candidate.valid?
  end

  test "experience should be present" do
    @candidate.experiencia = "     "
    assert_not @candidate.valid?
  end
end
