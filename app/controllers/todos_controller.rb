class TodosController < ApplicationController
  def new
    @todo = list.todos.new
  end

  def create
    @todo = list.todos.new(list_params)
    if @todo.save
      redirect_to list, info: "Se creó agrego #{@todo.name}"
    else
      render status: :unprocessable_entity
    end
  end

  def index
    @todos = Todo.where(list_id: params[:list_id])
  end

  def destroy
    @todo = list.todos.find(params[:id])
    @todo.destroy
    redirect_to list, warning: "Se eliminó #{@todo.name}"
  end

  def toggle
    @todo = Todo.find(params[:id])
    @todo.toggle!
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.update(@todo, partial: "todos/todo", locals: { todo: @todo }) }
    end
  end

  private

  def list_params
    params.require(:todo).permit(:name, :list_id)
  end

  def list
    @list ||= List.preload(:todos).find(params[:list_id] || list_params[:list_id])
  end
end
