module SessionsHelper

  def current_user=(user)
    @current_user = user
    session[:session_token] = user.session_token
  end

  def end_session
    p "IN HELPER"
    session[:session_token] = nil
  end

  def current_user
    p "got here"
    p session[:session_token]
    User.find_by_session_token(session[:session_token])
  end

end
