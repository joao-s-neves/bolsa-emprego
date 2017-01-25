class UsersController < ApplicationController
  before_action :logged_in, only: [:edit, :update, :destroy,
                                                               :following, :followers]
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.validate_address = false
    @user.validate_zip_code = false
    @user.validate_city = false
    @user.validate_contact = false
    @user.validate_page = false
    @user.validate_presentation = false
    @user.user_type = 3
    if @user.save
      flash[:success] = "Utilizador introduzido com sucesso!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      #EM FALTA
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Utilizador apagado"
    redirect_to users_url
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

  def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :activated)
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end

