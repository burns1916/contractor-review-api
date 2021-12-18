class ApplicationController < ActionController::API
    include ::ActionController::Cookies

    def current_user
        User.find_by(id: session[:user_id])
    end

    def logged_in?
        !!current_user
    end

    def client_user
        if current_user && current_user.meta_type == "Client"
            client = Client.find_by(id: current_user.meta.id)
    end

    def contractor_user
        if current_user && current_user.meta_type == "Contractor"
            contractor = Contractor.find_by(id: current_user.meta.id)
    end

end
