class UsersController < ApplicationController
  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :created_at => :desc })

    render({ :template => "users/index.html.erb" })
  end

  def show
    the_username = params.fetch("user_name")

    matching_users = User.where({ :username => the_username })

    @the_user = matching_users.at(0)

    render({ :template => "users/show.html.erb" })
  end


end
