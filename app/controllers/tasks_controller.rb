class TasksController < ApplicationController
  before_action :all_tasks, only: [:index, :create, :update]
  before_action :set_task, only: [:edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    #@tasks = Task.all.order(:deadline)
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    #@task = Task.new(task_params)
    @task = Task.create(task_params)
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    @task.update(task_params)
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    #Return all tasks through an instance variable
    def all_tasks
      @tasks = Task.all
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:description, :deadline)
    end
end
