class Api::V1::ClientsController < Api::V1::ApiController
 # skip_before_action :verify_authenticity_token
	def index
  		@clients = Client.all
  		render json: @clients
  	end
  	def create
  		@client = Client.new(client_params)
  		if @client.save
        render json: {client: @client}
      else
        render json: {errors: @client.errors.full_messages}
      end
  	end 
  	def show
  		@client = Client.find(params[:id])
      render json: @client.attributes.merge({"project_count" => @client.projects.count,"project" => @client.projects})
  	end
  	def update
  		@client = Client.find(params[:id])
  		if @client.update_attributes(client_params)
  			render json: @client
  		else
  			render json: {errors: @client.errors.full_messages}
  		end
  	end 

  	def destroy
  		@client = Client.find(params[:id])
  		render json: {notice: "successfully deleted your client", client: @client}
  	end	

  	private
  	
    def client_params
  		params[:client].permit(:name, :email, :company)
  	end
end