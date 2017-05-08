class UsersController < Clearance::UsersController

  def create
    @user = user_from_params
    if @user.save
      sign_in @user
      redirect_to dashboard_path, notice: "Sign up successful! You rock."
    else
      redirect_to sign_up_path, notice: "Sign up unsuccessful. Please try again."
    end
  end

  private

  def user_from_params
    email = user_params.delete(:email)
    username = user_params.delete(:username)
    password = user_params.delete(:password)

    Clearance.configuration.user_model.new.tap do |user|
      user.email = email
      user.username = username
      user.password = password
    end
  end

  def user_params
    params.fetch(Clearance.configuration.user_parameter, Hash.new)
  end
end
