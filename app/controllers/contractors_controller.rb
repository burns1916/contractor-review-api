class ContractorsController < ApplicationController

    def index
        contractors = Contractor.all
        render json: contractors, status: 200
    end

    def new
        contractor = Contractor.new
        contractor.build_user
    end

    def create
        contractor = Contractor.new(client_params)
            if contractor.save
                user = contractor.user
                session[:user_id] = user.id
                    render json: contractor, status: 200
            else
                response = {
                    error: contractor.errors.full_messages.to_sentence
                }
                render json: response, status: unprocessable_entity
            end
    end

    private

    def client_params
        params.require(:contractor).permit(:name, user_attributes: [:email, :password])
    end
    
end
