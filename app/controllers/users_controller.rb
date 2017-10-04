class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # TODO: redundant because of call from application controller?
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @friends = @user.friends.chronological_order
    @posts = @user.posts.chronological_order
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to current_user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

# there is no escape
=begin
  def destroy
    current_user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end
=end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
