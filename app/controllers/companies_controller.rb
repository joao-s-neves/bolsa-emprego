class CompaniesController < ApplicationController
  def show
    @company = Company.includes(:user).find(params[:id])
    @user = User.find(params[:id])
  end

  def index
    @companies = Company.includes(:user).paginate(page: params[:page])
  end

  def home
    @companies = Company.includes(:user).paginate(page: params[:page])
    @candidates = Candidate.all
    @offers = Offer.all
  end

  def new
    @company = Company.new
    @company.build_user

    @professional_activities = ProfessionalActivity.order(:name)
  end

  def create
    @company = Company.new(company_params)
    #@company.user.user_type = "E"
    @company.user.user_type = "2"

    if @company.save
      @company.user.send_activation_email
       flash[:info] = "Verifique o seu e-mail para ativar a sua conta."
      redirect_to root_url
    else
      @professional_activities = ProfessionalActivity.order(:name)
      render 'new'
    end
  end

  def edit
    @company = Company.includes(:user).find(params[:id])
    @professional_activities = ProfessionalActivity.order(:name)
  end

  def company_params
      params.require(:company).permit(:nif, :professional_activity_id,
                                                          user_attributes: [:name, :email,
                                                                                    :password, :password_confirmation,
                                                                                    :address, :zip_code, :city, :contact,
                                                                                    :page, :presentation])
  end
end
