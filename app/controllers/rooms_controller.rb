class RoomsController < ApplicationController
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  #:nameはroomsテーブルのname,user_idsの[]は配列として受け取ることを示す
  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end
end
