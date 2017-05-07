class Account::UsersController < ApplicationController

  before_action :authenticate_user!

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "信息更新成功"
      redirect_to edit_account_user_path(current_user)
    else
      flash[:notice] = "修改失败"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :school, :qq_number, :phone_number)
  end


end
