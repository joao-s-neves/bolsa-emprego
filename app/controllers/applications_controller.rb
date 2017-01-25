class ApplicationsController < ApplicationController
  before_action :logged_in_user

  def create
    @offer = Offer.find(params[:followed_id])
    current_user.candidate.follow(@offer)
    redirect_to @offer
    # respond_to do |format|
    #   format.html { redirect_to @offer }
    #   format.js
    # end
  end

  def destroy
    @offer = Application.find(params[:id]).followed
    current_user.candidate.unfollow(@offer)
    redirect_to @offer
    # respond_to do |format|
    #   format.html { redirect_to @offer }
    #   format.js
    # end
  end
end
