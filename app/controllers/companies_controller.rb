class CompaniesController < ApplicationController
  def show
    @user = User.find(params[:id])
    #@company = Company.find(params[:id])
  end

  def new
    @user = User.new
    @user.build_company
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.tipo = "E"
      @user.save
      flash[:success] = "Bem-vindo à Bolsa de Emprego!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def user_params
      params.require(:user).permit(:nome, :email, :password,
                                   :password_confirmation, :morada, :cpostal,
                                   :localidade, :contacto,  :pagina, :apresentacao, company_attributes: [:nif, :atividade_profissional])
    end
end
