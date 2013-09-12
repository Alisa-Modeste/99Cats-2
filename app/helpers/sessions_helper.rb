module SessionsHelper

  def current_user=(user)
    @current_user = user
    session[:session_token] = user.session_token
  end

  def end_session
    setted = Session.find_by_session_token(session[:session_token])
    p "setted #{setted}"
    setted.destroy
    session[:session_token] = nil
  end

  def current_user
    current_session = Session.find_by_session_token(session[:session_token])
    current_session.user unless current_session.nil?
  end

end
