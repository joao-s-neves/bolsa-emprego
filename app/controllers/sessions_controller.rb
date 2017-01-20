class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        candidate = Candidate.find_by_id(user.candidate_id)
        company = Company.find_by_id(user.company_id)
        if user.candidate?
          redirect_back_or candidate
        elsif user.company?
          redirect_back_or company
        elsif user.backoffice?
          redirect_back_or root_path
        end
      else
        message  = "Conta por activar. "
        message += "Verifique o seu email com o link de activação."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Email ou password inválidos'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
