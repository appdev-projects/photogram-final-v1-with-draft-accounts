class ApplicationController < ActionController::Base
  before_action(:load_current_user)
  
  # Uncomment line 5 in this file and line 3 in UserAuthenticationController if you want to force users to sign in before any other actions.
  # before_action(:force_user_sign_in)
  
  def load_current_user
    the_id = session[:user_id]
    
    @current_user = User.where({ :id => the_id }).first
  end
  
  def force_user_sign_in
    if @current_user == nil
      redirect_to("/user_sign_in", { :notice => "You have to sign in first." })
    end
  end

  def index

    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc })

    render({ :template => "users/index.html.erb" })
  end


  def show
    the_username = params.fetch("path_username")

    matching_users = User.where({ :username => the_username })

    @the_user = matching_users.at(0)

    render({ :template => "users/show.html.erb" })
  end

  def liked_photos
@photos = @current_user.photos

  
    render({ :template => "users/liked_photos.html.erb" })
  end


end
