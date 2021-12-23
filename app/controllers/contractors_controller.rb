class ContractorsController < ApplicationController

    def index
        contractors = Contractor.all
        render json: contractors, status: 200
    end

    def new
        contractor = Contractor.new
    end

    def create
        contractor = Contractor.new(contractor_params)
            user = contractor.build_user(user_params)
            if user.save
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

    def contractor_params
        params.permit(:business_name, :license_number)
    end

    def user_params
        params.permit(:email, :password, :meta_type)
    end
    
end
