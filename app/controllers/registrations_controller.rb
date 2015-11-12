class RegistrationsController < ApplicationController
  def new
    render :new, locals: { registration: User.new }
  end

  def create
    user = User.new user_params

    if user.save
      redirect_to root_url, notice: t("registration.success", email: user.email)
    else
      render :new, locals: { registration: user }
    end
  end

  private

  def user_params
    params.require(:registration).permit(:email, :password)
  end
end
