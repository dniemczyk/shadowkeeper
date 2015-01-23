module SessionsHelper

  def sign_in(user)
    session[:user_id] = user.id
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user?(user)
    user == current_user
  end

  # Signs out the current user
  def sign_out
    session.delete(:user_id)
    cookies.delete(:user_id)
    self.current_user = nil
  end
end
