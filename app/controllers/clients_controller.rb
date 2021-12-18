class ClientsController < ApplicationController
    
    def new
        client = Client.new
        client.build_user
    end

    def create
        client = Client.new(client_params)
            if client.save
                user = client.user
                session[:user_id] = user.id
                    render json: client, status: 200
            else
                response = {
                    error: client.errors.full_messages.to_sentence
                }
                render json: response, status: unprocessable_entity
            end
    end

    private

    def client_params
        params.require(:client).permit(:name, user_attributes: [:email, :password])
    end

end
