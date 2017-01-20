class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    candidate = Candidate.find_by_id(user.candidate_id)
    company = Company.find_by_id(user.company_id)
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = "Conta activada!"
      if user.candidate?
        redirect_to candidate
      elsif user.company?
        redirect_to company
      end
    else
      flash[:danger] = "Link de activação inválido"
      redirect_to root_url
    end
  end
end
