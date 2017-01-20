class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    respond_to do |format|
      format.html {
        if current_user.candidate?
            redirect_to candidate
        elsif current_user.company?
            redirect_to company
        end } #redirect_to @user }
      format.js
    end
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    respond_to do |format|
      format.html {
        if current_user.candidate?
            redirect_to candidate
        elsif current_user.company?
            redirect_to company
        end }#redirect_to @user }
      format.js
    end
  end
end
