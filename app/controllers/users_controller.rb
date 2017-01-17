class UsersController < ApplicationController
  def show
    @user = User.includes(:candidate, :company).all.find(params[:id])
    #@user = User.includes(:candidate).all
    #@user = User.includes(:company).all
    #@candidate = Candidate.find(params[:id])
  end

  def new
    @user = User.new
    @user.build_candidate
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.tipo = "C"
      @user.save
      log_in @user
      flash[:success] = "Bem-vindo à Bolsa de Emprego!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.includes(:candidate, :company).all.find(params[:id])
    if @user.update_attributes(user_params)
      #EM FALTA
    else
      render 'edit'
    end
  end

  private

  def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :address, :zip_code,
                                   :city, :contact,  :page, :presentation, candidate_attributes: [:d_nascimento, :cartao_cidadao, :area_profissional,
                                                                                                                                                    :hab_literarias, :habilitation_description, :situacao, :experiencia, :user_id])
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
end
end

