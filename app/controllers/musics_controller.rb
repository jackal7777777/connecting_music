# coding: utf-8
class MusicsController < ApplicationController
  before_action :authenticate_user!, only: :new
  def listen
    # 諸々データ取得
    @user = current_user;
    @music_id = params[:music_id] # getでの楽曲ID取得
    @music_info = Music.find_by(:id => @music_id) # 楽曲情報
    @artist_info = User.find_by(:id => @music_info[:user_id]) # アーティスト情報
    @comment = Comment.new

    # ページアクセス時のコメント欄表示内容取得
    @comments = Comment.where("music_id = ?", @music_id).order("created_at DESC").limit(5)
    
    # 楽曲ファイルパス取得
    @music_play = "/assets/" + @music_info[:filename]
    gon.music_path = @music_play

    # 再生回数カウント処理
    @music_info.increment! :count
  end

  def new
    @user = current_user;
    @music = Music.new
    @result = nil

    @post_params = params[:music]

    if @post_params.present?
      f = music_params[:filename]
      @music = Music.new(music_params)
      @music.filename = f.original_filename
      @music.content_type = f.content_type
      
      if @music.save
        @result = true
        @new_music = Music.find_by(:song_title => music_params[:song_title])
        @new_music_link = "listen/"+@new_music.id.to_s
        File.open(full_path + @music.filename.to_s, 'wb') do |of|
          of.write(f.read)
        end
      else
        @result = false
      end
    end
    
  end
  private
  def music_params
    params.require(:music).permit(:genre_id, :user_id, :song_title, :filename, :description)
  end

  private
  def full_path
    return @full_path = Rails.root.to_s + '/app/assets/music/'.to_s
  end

end
