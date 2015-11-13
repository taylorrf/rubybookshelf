class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.lookup_for_authentication_with identifier: email

    if user.authenticate password
      session.update user_id: user.id
      redirect_to root_url, notice: t("session.success", email: user.email)
    else
      flash.now[:error] = t("session.error")
      render :new
    end
  end

  def destroy
    session.clear

    redirect_to root_url
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

  def email
    session_params.fetch :email
  end

  def password
    session_params.fetch :password
  end
end
