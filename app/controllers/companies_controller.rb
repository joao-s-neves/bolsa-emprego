class CompaniesController < ApplicationController
  def show
    @company = Company.includes(:user).find(params[:id])
    @user = User.find(params[:id])
  end

  def index
    #@companies = Company.includes(:user).paginate(page: params[:page])
    @companies = if params[:search]
      Company.includes(:user).search(params[:search]).paginate(page: params[:page])
       else
       Company.includes(:user).paginate(page: params[:page])
     end
     #@user = Company.includes(:user).find(params[:id])
    # @companies = if params[:search]
    #   Company.includes(:user).where('user.name LIKE ?', "%#{params[:search]}%").paginate(page: params[:page])
    # else
    #   Company.includes(:user).paginate(page: params[:page])
    # end
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
    @company.user.user_type = 2

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

  def update
    @company = Company.includes(:user).find(params[:id])
    @company.user.validate_email = false
    @company.user.validate_password = false
    if @company.update_attributes(company_params)
      flash[:success] = "Perfil actualizado"
      redirect_to @company
    else
     @professional_activities = ProfessionalActivity.order(:name)
      render 'edit'
    end
  end

  def company_params
      params.require(:company).permit(:nif, :professional_activity_id,
                                                          user_attributes: [:name, :email,
                                                                                    :password, :password_confirmation,
                                                                                    :address, :zip_code, :city, :contact,
                                                                                    :page, :presentation, :picture, :id])


  end
end
