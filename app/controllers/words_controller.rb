class WordsController < ApplicationController
  before_action :authenticate_user, only: [:index, :new, :create, :destroy, :logout]

  def authenticate_user
    if session[:admin] == nil
      redirect_to root_path
    end
  end

  def index
    @words = Word.all.order(id: :asc)
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(content: params[:content])
    if @word.save
      redirect_to controller: :words, action: :index
    else
      render action: :new
    end
  end

  def destroy
    @word = Word.find_by(id: params[:id])
    @word.destroy
    redirect_to controller: :words, action: :index
  end

  def login
  end

  def signin
    if params[:user_id].to_i == 20010207 && params[:password].to_i == 20000923
        session[:admin] = 1
        redirect_to controller: :words, action: :index
    else
      render action: :login
    end
  end

  def logout
    session[:admin] = nil
    redirect_to controller: :home, action: :index
  end
end
