class CandidatesController < ApplicationController
  def show
    @candidate = Candidate.includes(:user).find(params[:id])
    @user = User.find(params[:id])
  end

  def index
    @candidate = Candidate.includes(:user).paginate(page: params[:page])
  end

  def new
    @candidate = Candidate.new
    @candidate.build_user

    @professional_areas = ProfessionalArea.order(:name)
    @habilitations = Habilitation.order(:name)
    @professional_situations = ProfessionalSituation.order(:name)
  end

  def create
    @candidate = Candidate.new(candidate_params)
    @candidate.user.user_type = "C"

    if @candidate.save
      flash[:success] = "Bem-vindo à Bolsa de Emprego!"
      redirect_to @candidate
    else
      @professional_areas = ProfessionalArea.order(:name)
      @habilitations = Habilitation.order(:name)
      @professional_situations = ProfessionalSituation.order(:name)
      render 'new'
    end
  end

  def candidate_params
      params.require(:candidate).permit(:birth_date, :document, :habilitation_description, :experience, :professional_area_id,
                                                               :habilitations_id, :professional_situation_id,
                                                               user_attributes: [:name, :email, :password, :password_confirmation,
                                                                                    :address, :zip_code, :city, :contact,
                                                                                    :page, :presentation, :picture])
    end
end
