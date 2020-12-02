class UsersController < ApplicationController
  

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def admin_user
    if !(current_user.id == current_user.admin)
      redirect_to root_path
    end
  end
end
