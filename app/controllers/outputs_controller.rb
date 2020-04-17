class OutputsController < ApplicationController

  def new
    @output = Output.new
  end

  def create
    @output = Output.create(output_params)
    redirect_to "/tweets/#{@output.tweet.id}"
  end

  private
  def output_params
    params.require(:output).permit(:review, :youtube_url).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end