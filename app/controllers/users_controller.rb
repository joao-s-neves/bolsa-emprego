class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @user.build_candidate
  end

  def create
    @user = User.new(user_params)
    @candidate = Candidate.new(candidate_params)
    if @user.save && @candidate.save
      flash[:success] = "Bem-vindo à Bolsa de Emprego!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def user_params
      params.require(:user).permit(:nome, :email, :password,
                                   :password_confirmation, :morada, :cpostal,
                                   :localidade, :contacto,  :pagina, :apresentacao, candidate_attributes: [:d_nascimento, :cartao_cidadao, :area_profissional,
                                                                                                                                                    :hab_literarias, :hab_ds, :situacao, :experiencia, :userid])
    end

    def candidate_params
      params.require(:candidate).permit(:d_nascimento, :cartao_cidadao, :area_profissional, :hab_literarias, :hab_ds, :situacao, :experiencia, :userid)
    end
end
