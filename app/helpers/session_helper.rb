def session_set_current_user(user)
  session[:current_user_id] = user.id
end

def session_logout_current_user
  session[:current_user_id] = nil
end
