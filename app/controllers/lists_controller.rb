class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to root_path, info: "Se creó la lista #{@list.title}"
    else
      render status: :unprocessable_entity
    end
  end

  def show
    @list = List.preload(:todos).find(params[:id])
    @todos = @list.todos
  end

  def destroy
    @list = List.find(params[:id]).destroy
    redirect_to root_path, warning: "Se elimino la lista #{@list.title}"
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to root_path, info: "Se actualizó la lista #{@list.title}"
    else
      render status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end
end
