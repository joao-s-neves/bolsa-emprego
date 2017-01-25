class OffersController < ApplicationController
    def show
    @offer = Offer.includes(:company).find(params[:id])
    @candidates = Candidate.includes(:user).paginate(page: params[:page])
    #@company = Company.find(params[:id])
  end

  def index
    @offers = Offer.paginate(page: params[:page])
  end

  def new
    @offer = Offer.new
    @professional_activities = ProfessionalActivity.order(:name)
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.company_id = current_user.company_id
    if @offer.save
      flash[:success] = "Oferta introduzida com sucesso!"
      redirect_to @offer
    else
      @professional_activities = ProfessionalActivity.order(:name)
      render 'new'
    end
  end

  def edit
    @offer = Offer.includes(:company).find(params[:id])
    @professional_activities = ProfessionalActivity.order(:name)
  end

  def update
    @offer = Offer.includes(:company).find(params[:id])
    if @offer.update_attributes(offer_params)
      flash[:success] = "Oferta atualizada"
      redirect_to @offer
    else
      @professional_activities = ProfessionalActivity.order(:name)
      render 'edit'
    end
  end

  def followers
    @title = "Candidatos interessados"
    @offer  = Offer.find(params[:id])
    @offers = @offer.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  def offer_params
      params.require(:offer).permit(:title, :begins, :ends,
                                                       :description, :contract_type, :salary, :picture, :professional_activity_id, :active)
  end
end
