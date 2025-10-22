class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(message: params[:tweet][:message])
    @tweet.user_id = 1

    if @tweet.save
      redirect_to tweets_path, notice: "ツイートを作成しました"
    else
      puts "保存失敗の理由:"
      puts @tweet.errors.full_messages
      flash.now[:alert] = @tweet.errors.full_messages.join(", ")
      render :new
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to tweets_path, notice: "ツイートを削除しました"
  end
end
