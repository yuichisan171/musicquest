class OutputsController < ApplicationController

  def new
    @output = Output.new
  end

  def create
    @output = Output.create(output_params)
    if @output.save
      redirect_to tweet_path(@output.tweet.id), notice: "投稿完了です!"
    else
      flash.now[:alert] = "メッセージを入力してください!"
      render template: "outputs/new"
    end
  end

  private
  def output_params
    params.require(:output).permit(:review, :youtube_url).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end