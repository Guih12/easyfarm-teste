class ProjectsController < ApplicationController
    def index
        projects = Project.all

        if projects
         render json: projects, status: :ok
        else
          render json: {message: 'project is empty'}, status: :not_found
        end
    end


    def show
        project = Project.find_by(id: params[:id])

        if project
         render json: project, status: :ok

        else
        render json: {message: 'Project not found'}, status: :not_found
        end
    end

    def store
        project = Project.new(name: params[:name])

        if project.save
          render json: project, status: :created
        else
          render json: {message: 'Error in create project'}, status: :unprocessable_entity
        end
    end


    def update
        project = Project.find_by(id: params[:id])

        if project
            project.update(name: params[:name])
            render json: project, status: :ok
        end
    end
end
