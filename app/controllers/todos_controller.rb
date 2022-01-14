class TodosController < ApplicationController
  def new
    @todo = Todo.new(list_id: params[:list_id])
  end

  def create
    @todo = Todo.new(list_params)
    if @todo.save
      respond_to do |format|
        @todos = Todo.where(list_id: list_params[:list_id])
        format.turbo_stream { render :index }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.update(@todo, partial: "todos/form") }
      end
    end
  end

  def index
    @todos = Todo.where(list_id: params[:list_id])
  end

  private

  def list_params
    params.require(:todo).permit(:name, :list_id)
  end
end