class AppointmentsController < ApplicationController

    def index
        if params[:client_id] && client = Client.find_by_id(params[:client_id])
            appointment = client.appointments
            render json: appointments
        elsif params[:contractor_id] && contractor = Contractor.find_by_id(params[:contractor_id])
            appointments = contractor.appointments
            render json: appointments
        else
            response = {
                appointment.errors.full_messages.to_sentence
            }
            render json: response
        end
    end

    def new
        appointments = Appointments.new
    end

    def create
        appointment = current_user.meta.appointments.build(appointment_params)
            if appointment.save
                render json: appointment
            else
                response = {
                    appointment.errors.full_messages.to_sentence
                }
                render json: response
            end
    end
    
    def show
        appointment = Appointment.find_by(id: params[:id])
    end

    private

    def appointment_params
        params.require(:appointment).permit(:job_name, :job_description, :appointment_time, :client_id, :contractor_id)
    end
end
