class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def search
    @users = User.search(
      query: {
        multi_match: {
          query: params[:q].to_s,
          fields: ['name', 'intro']
        }
      }
    ).records

    render action: 'index'
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to root_path
    else
      render action: 'new'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to root_path
  end
end
