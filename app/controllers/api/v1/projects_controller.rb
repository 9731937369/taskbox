class Api::V1::ProjectsController < Api::V1::ApiController
	def index
		@projects = Project.all 
		render json: @projects, except: [:created_at, :updated_at] 
	end
	def create
		@project = Project.new(project_params)
		if @project.save
			# incase you want to send additional key value pairs which are not already a part of the object 
			render json: @project.attributes.merge({"client_name" => @project.client.name})
		else
			render json: {errors: @project.errors.full_messages}
		end
	end


	private 
	def project_params
		params[:project].permit(:name, :start_date, :client_id)

	end
end
