class ServiceProject

    def initialize(params)
      @name = params[:name]
    end


    def self.get_all_projects
        begin 
            project = Project.all
        rescue ActiveRecord::RecordNotFound => e 
            false
        end
    end 


    def self.get_pk_project(id)
        begin
            project = Project.find_by(id: id)
           
        rescue ActiveRecord::RecordNotFound => e
            false
        end
    end

    def create_project
        begin
            project = Project.new(name: @name)

            if project.save
                 return project
            end
        rescue
            false
        end
    end


    def self.update_project(params)
        begin
            project = Project.find_by(id: params[:id])
            if project
                project.update(name: params[:name])
                return project
            end
        rescue ActiveRecord::RecordNotFound => e
            false
        end
    end

    def self.delete_project(id)
        begin
            project = Project.find_by(id: id)
            if project
                project.destroy
            end
        rescue ActiveRecord::RecordNotFound => e
            false
        end
    end
    
end