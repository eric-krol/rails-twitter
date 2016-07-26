class TweetsController < ApplicationController

  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  def new
    @tweet = Tweet.new
  end

def create
  @tweet = Tweet.new(tweet_params)
  if @tweet.save
    redirect_to @tweet, notice: "You just tweeted!"
  else
    render :new
  end
end

def update
  if @tweet.update(tweet_params)
    redirect_to @tweet, notice: "Tweet was updated"
  else
  render :edit
end
end

def show
@tweet = Tweet.find(params[:id])
end

def index
  @t = Tweet.all
end
def edit
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path
  end
private
def set_tweet
    @tweet = Tweet.find(params[:id])
 end
def tweet_params
  params.require(:tweet).permit(:message, :user_id)
end
end
