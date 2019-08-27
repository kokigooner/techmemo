class WordsController < ApplicationController
  def index
    @words = Word.all

  end

  def new
    @word = Word.new
  end

  def create
    Word.create(word:params[:post_params], mean:params[:post_params])
    #redirect_to root_path, notice:  '新規作成しました'
    # new_word = current_user.words.new(word:params[:post][:word], mean:params[:post][:mean])
    # new_word.save
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
    params.require(:word).permit!
  end
end
