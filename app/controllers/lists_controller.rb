class ListsController < ApplicationController
  def index
    @lists = List.all
    @list = List.new
  end

  def new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to lists_path
    else
      render status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end
end
