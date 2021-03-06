class WordsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    if user_signed_in?
      @words = Word.where(user_id: current_user.id)
    else
      redirect_to  new_user_session_path
    end
  end

  def new
    @word = Word.new
  end

  def create
    Word.create(word: post_params[:word], mean: post_params[:mean], user_id: current_user.id)
    redirect_to root_path
  end

  def edit
    @word = Word.find(params[:id])
  end

  def update
    word = Word.find(params[:id])
    if word.user.id == current_user.id
      word.update(post_params)
      redirect_to root_path
    end
  end

  def destroy
    word = Word.find(params[:id])
    word.destroy if word.user_id == current_user.id
    redirect_to root_path
  end

  private

  def post_params
    params.permit(:word, :mean)
  end

  def move_to_index
    redirect_to action: "index" unless user_signed_in?
  end

end
