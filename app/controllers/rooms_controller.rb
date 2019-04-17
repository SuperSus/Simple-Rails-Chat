class RoomsController < ApplicationController
  before_action :set_room

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new room_params

    if @room.save
      flash[:success] = "Room #{@room.name} was created successfully"
      redirect_to rooms_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @room.update_attributes(room_params)
      flash[:success] = "Room #{@room.name} was updated successfully"
      redirect_to rooms_path
    else
      render :new
    end
  end
  
  private

  def set_room
    @room = Room.find(params[:id]) if params[:id]
  end

  def room_params
    params.require(:room).permit(:name)
  end
end
