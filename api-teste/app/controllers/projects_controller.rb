class ProjectsController < ApplicationController
    def index
        projects = ServiceProject.get_all_projects

        if projects
         render json: projects, status: :ok
        else
          render json: {message: 'project is empty'}, status: :not_found
        end
    end


    def show

        project = ServiceProject.get_pk_project(params[:id])
        if project
            render json: project, status: :ok

        else
            render json: {message: 'Project not found'}, status: :not_found
        end
    end

    def store
        project = ServiceProject.new(name: params[:name]).create_project
        if project
            render json: project, status: :created
        else
             render json: {message: 'Error in create project'}, status: :unprocessable_entity
        end
    end


    def update

        project = ServiceProject.update_project(id: params[:id], name: params[:name])
        if project
            render json: project, status: :ok
        else
            render json: {message: 'Project not found'}, status: :not_found
        end
    end

    def destroy

        project = ServiceProject.delete_project(params[:id])
        if project
            render json: {message: "Project deleted with success"}, status: :ok
        else
            render json: {message: "Project not found"}, status: :not_found
        end
    end
end
