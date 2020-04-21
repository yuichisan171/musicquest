class TweetsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @tweets = Tweet.includes(:user).order("created_at DESC").page(params[:page]).per(8)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweet_params)
    if @tweet.save
      redirect_to root_path, notice: "ツイート完了!"
    else
      flash.now[:alert] = "メッセージを入力してください!"
      render template: "tweets/new"
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    @output = Output.new
    @outputs = @tweet.outputs.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end

  private
  def tweet_params
    params.require(:tweet).permit(:text).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
