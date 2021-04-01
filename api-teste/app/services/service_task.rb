class ServiceTask

    def initialize(params)
      @date = params[:date]
      @description = params[:description]
      @status = params[:status]
      @project_id =  params[:project_id]
    end


    def self.get_all_tasks
        begin
            tasks = Task.all
        rescue ActiveRecord::RecordNotFound => e
            return false 
        end
    end


    def self.get_task_pk(id)
        begin
            tasks = Task.find_by(id: id)
        rescue ActiveRecord::RecordNotFound => e
            return false 
        end
    end


    def create_task
        begin
            task = Task.new(date: @date, description: @description, 
                status: @status, project_id: @project_id)    
            
            if task.save
                return task
            end
        rescue
            false
        end
    end

    
    def self.update_task(params)
        begin
            task = Task.find_by(id: params[:id])
            if task
                task.update(params[:task])
            end
        rescue ActiveRecord::RecordNotFound => e
            false
        end
    end


   def self.delete_task(id)
        begin
            task = Task.find_by(id: id)
            if task
                task.destroy
            end
        rescue ActiveRecord::RecordNotFound => e
            false
        end
    end
end