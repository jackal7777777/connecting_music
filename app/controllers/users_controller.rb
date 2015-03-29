# coding: utf-8
class UsersController < ApplicationController
  before_action :authenticate_user!, only: :edit
  def index
    @music_id = 1
    @music_info = Music.order("created_at DESC").limit(12)
    @comment = Comment.new
  end

  def show
    
  end

  def login
    #render :nothing => true

  end

  def logout

  end

end
