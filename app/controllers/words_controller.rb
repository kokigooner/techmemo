class WordsController < ApplicationController
  before_action :move_to_index, except: :index
  def index
    @words = Word.all
  end

  def new
    @word = Word.new
  end

  def create
    Word.create(post_params)
    redirect_to root_path
  end

  def edit
    @word = Word.find(params[:id])
  end

  def update
    word = Word.find(params[:id])
    if word.user.id == current_user.id
      word.update(word_params)
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
