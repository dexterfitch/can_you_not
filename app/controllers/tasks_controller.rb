class TasksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.new
  end

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)
    if @task.save
      flash[:notice] = @task.description + " added to " + @list.name
      redirect_to list_path(@task.list)
    else
      render :new
    end
  end

  def edit
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
  end

  def update
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
    old_description = @task.description
    if @task.update(task_params)
      # flash[:notice] = formatted_flash(@task, params[:task][:done] ? :done : :description)
      flash[:notice] = old_description + " has been changed to " + @task.description
      redirect_to list_path(@task.list)
    else
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
    destroyed_task_description = @task.description
    @task.destroy
    flash[:notice] = destroyed_task_description + " deleted!"
    redirect_to list_path(@task.list)
  end

private
  def task_params
    params.require(:task).permit(:description, :done)
  end

  # def formatted_flash
  # or "helper methods"
  # alternatively, class Flash for handling all Flash logic
end
