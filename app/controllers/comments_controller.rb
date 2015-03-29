# coding: utf-8
class CommentsController < ApplicationController
  #before_action :authenticate_user!, only: :show
  def create

    #render :nothing => true

  	#@comment = Comment.new
    #@comment.user_id = params[:comment][:user_id]
    #@comment.music_id = params[:comment][:music_id]
    #@comment.body = params[:comment][:body]
    @comments = Comment.where("music_id = ?", comment_params[:music_id]).order("created_at DESC").limit(10)
    @comment = Comment.new(comment_params)
    @now = 0#アクセス時なのかコメント投稿時なのか判断するための変数
    
    respond_to do |format|
      if @comment.save
        @now = 1 
        format.js
      end
    end

    #redirect_to(:back)
  end

  #music/listenから受け取ったパラメタ。strong_
  private
  def comment_params
    params.require(:comment).permit(:user_id, :music_id, :body)
  end

end
