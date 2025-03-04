class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end
    
  def update
    if @task.update(task_params)
      respond_to do |format|
        format.html { redirect_to task_path(@task) }
        format.json { render json: { status: 'success' } }
      end
    else
      respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: { status: 'error' } }
      end
    end
  end
  
  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private
  
  def set_task
    @task = Task.find(params[:id])
end

def task_params
  params.require(:task).permit(:title, :details, :completed)
end
end
