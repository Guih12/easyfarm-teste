class TasksController < ApplicationController

    def index
        tasks = ServiceTask.get_all_tasks
        if tasks
            render json: tasks, status: :ok
        end
    end

    def show

        task = ServiceTask.get_task_pk(params[:id])

        if task
            render json: task, status: :ok
        else
            render json: {message: 'Task not found'}, status: :not_found
        end
    end

    def store
        task = ServiceTask.new(tasks_params).create_task

        if task
            render json: task, status: :created
        else
            render json: {message: 'Error in create task'}, status: :unprocessable_entity
        end
    end


    def update
        
        task = ServiceTask.update_task(id: params[:id], task: tasks_params)

        if task
            render json: task, status: :ok
        else
            render json: {message: 'Task not found'}, status: :not_found
        end
    end

    def destroy
        task = ServiceTask.delete_task(params[:id])

        if task
            render json: {message: "Task deleted with success"}, status: :ok

        else
            render json: {message: "Task not found"}, status: :not_found
        end
    end

    private

    def tasks_params
        params.permit(:date, :description, :status, :project_id)
    end
end
