class UsersController < ApplicationController

  def new
    @action = users_path
    render :new
  end

  def create
    passhash = Digest::SHA1.hexdigest(params[:password])
    @user = User.create(email: params[:email],
                        password: passhash)
    flash[:notice] = "User successfully created. Welcome!"
    redirect_to :root
  end

  def index
    @user = User.all
  end

end
