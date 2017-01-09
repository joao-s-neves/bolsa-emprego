class CompaniesController < ApplicationController
  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:success] = "Bem-vindo à Bolsa de Emprego!"
      redirect_to @company
    else
      render 'new'
    end
  end

  def company_params
      params.require(:company).permit(:nome, :email, :password,
                                   :password_confirmation, :morada, :cpostal,
                                   :localidade, :contacto,  :pagina, :nif,
                                   :atividade_profissional, :apresentacao)
    end
end
