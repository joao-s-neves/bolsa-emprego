class CompaniesController < ApplicationController
  def show
    @company = Company.includes(:user).find(params[:id])
    @user = User.find(params[:id])
  end

  def index
    @companies = Company.includes(:user).paginate(page: params[:page])
  end

  def new
    @company = Company.new
    @company.build_user

    @professional_activities = ProfessionalActivity.order(:name)
  end

  def create
    @company = Company.new(company_params)
    @company.user.user_type = "E"

    if @company.save
      flash[:success] = "Bem-vindo à Bolsa de Emprego!"
      redirect_to @company
    else
      @professional_activities = ProfessionalActivity.order(:name)
      render 'new'
    end
  end

  def edit
    @company = Company.includes(:user).find(params[:id])
  end

  def company_params
      params.require(:company).permit(:nif, :professional_activity_id,
                                                          user_attributes: [:name, :email,
                                                                                    :password, :password_confirmation,
                                                                                    :address, :zip_code, :city, :contact,
                                                                                    :page, :presentation])
  end
end
