class UsersController < ApplicationController

    def new
        user = User.new
        render json: user, status: 200
    end


    private

    def user_params
        params.permit(:username, :password)
    end

end
