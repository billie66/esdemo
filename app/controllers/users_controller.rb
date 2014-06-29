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
      },
      highlight: {
        fields: {
          name: {},
          intro: {}
        }
      }
    ).records

    session[:redirect_url] = request.url
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

    redirect_to session[:redirect_url]
  end
end
