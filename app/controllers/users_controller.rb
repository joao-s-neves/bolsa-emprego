class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    #@candidate = Candidate.find(params[:id])
  end

  def new
    @user = User.new
    @user.build_candidate
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.tipo = "C"
      @user.save
      log_in @user
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
                                                                                                                                                    :hab_literarias, :hab_ds, :situacao, :experiencia, :user_id])
    end
end
