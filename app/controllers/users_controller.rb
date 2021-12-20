class UsersController < ApplicationController

    def index
        users = User.all
        render json: users, include: [:clients], status: 200
    end
end
