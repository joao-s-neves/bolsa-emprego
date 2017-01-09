class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Bem-vindo à Bolsa de Emprego!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def user_params
      params.require(:user).permit(:nome, :email, :password,
                                   :password_confirmation, :morada, :cpostal,
                                   :localidade, :contacto,  :pagina, :d_nascimento,
                                   :cartao_cidadao, :area_profissional, :apresentacao,
                                   :hab_literarias, :hab_ds, :situacao, :experiencia)
    end
end
