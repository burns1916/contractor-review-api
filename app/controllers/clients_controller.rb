class ClientsController < ApplicationController
    
    def index
        clients = Client.all
        render json: clients, include: [:users], status: 200
    end

    def new
        client = Client.new
    end

    def create
        client = Client.new(client_params)
            user = client.build_user(user_params)
            if client.save && user.save
                session[:user_id] = user.id
                render json: client, status: 200
            else
                response = {
                    error: client.errors.full_messages.to_sentence
                }
                render json: response, status: :unprocessable_entity
            end
    end

    private

    def client_params
        params.require(:client).permit(:name, user_attributes: [:id, :email, :password, :meta_type, :meta_id])
    end

    def user_params
        params.permit(:id, :email, :password, :meta_type, :meta_id)
    end

end
