class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    @candidate = Candidate.find_by_id(@user.candidate_id)
    @company = Company.find_by_id(@user.company_id)
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
      if @user.tipo = "C"
        #@candidate = Candidate.find_by_id(@user.candidate_id)
        redirect_to @candidate
      elsif @user.tipo ="E"
        #@company = Company.find_by_id(@user.company_id)
      redirect_to @company
    end
      #redirect_to @user
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
