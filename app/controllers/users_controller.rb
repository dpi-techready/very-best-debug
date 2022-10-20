class UsersController < ApplicationController

  def index
    # force a ruby console to appear under this context
    # byebug
    matching_users = User.all
    @users = matching_users.order(:created_at)

    render({ :template => "user_templates/index.html.erb"})
  end
  
  def show
    username = params.fetch("username")
    matching_users = User.where({ :username => username })
    @user = matching_users.at(0)

    render({ :template => "user_templates/show.html.erb"})
  end
  
  def create
    insert_user_record = params.fetch("query_username")
    a_new_user = User.new
    a_new_user.username = insert_user_record
    a_new_user.save

    redirect_to("/users/" + a_new_user.username)

    # @user = User.new
    # user.username = params.fetch("query_username")
    # user.save
    
    # redirect_to("/users/#{user.username}")
  end
  
  def update
    user_id = params.fetch("user_id")
    matching_users = User.where({ :id => user_id })
    the_user = matching_users.at(0)

    update_user = params.fetch("query_username")
    the_user.username = update_user
    the_user.save

    redirect_to("/users/#{the_user.username}")
    
    # the_user.username = params.fetch("query_username")
    # the_user.save
    # redirect_to("/users/#{user.username}")
  end

end
