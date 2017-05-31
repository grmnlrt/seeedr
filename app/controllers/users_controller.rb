class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, :notice => "Your profile has been deleted"
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :company_name, :email, :password, :description, :address, :is_company)
  end

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end
end
