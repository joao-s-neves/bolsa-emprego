class OffersController < ApplicationController
  def new
    @offer = Offer.new
  end

  def index
    @offer = Offer.paginate(page: params[:page])
  end

  def create
    @offer = Offer.new(offer_params)
    if @offer.save
      flash[:success] = "Oferta introduzida com sucesso!"
      redirect_to @offer
    else
      render 'new'
    end
  end

  def offer_params
      params.require(:offer).permit(:title, :begins, :ends,
                                                       :description, :contract_type, :salary)
  end
end
