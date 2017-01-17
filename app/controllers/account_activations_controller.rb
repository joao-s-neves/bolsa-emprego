class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = "Conta activada!"
      if user.user_type == 1
        redirect_to candidate
      elsif user.user_type == 2
        redirect_to company
      end
    else
      flash[:danger] = "Link de activação inválido"
      redirect_to root_url
    end
  end
end
