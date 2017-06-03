class UsersController < ApplicationController
  def new
   @user=User.new
  end
  def create
   @user=User.new(user_params)
   if @user.save
     flash[:notice] = "Congratulations you have registered successfully"
     redirect_to root_url
   else
      flash[:notice] = "Something Went wrong! try again"
      redirect_to root_url
   end
  end
  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
