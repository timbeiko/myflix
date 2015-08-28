class ForgotPasswordsController < ApplicationController
  def create
    user = User.where(email: params[:email]).first
    if user
      AppMailer.send_forgot_password(user).deliver
      redirect_to forgot_password_confirmation_path
    else
      flash[:danger] = params[:email].blank? ? "Oops! It seems you forgot to enter your email." : "It seems like that email is not valid."
      redirect_to forgot_password_path
    end
  end

  def confirm

  end
end