class AppointmentsController < ApplicationController

    def index
        appointments = Appointment.all
        render json: appointment
    end

    def new
        appointments = Appointments.new
    end

    def create
        appointment = Appointment.new(appointment_params)
            if appointment.save
                render json: appointment
            else
                response = {
                    appointment.errors.full_messages.to_sentence
                }
                render json: response, status: :unprocessable_entity
            end
    end
    
    def show
        appointment = Appointment.find(id: params[:id])
    end

    private

    def appointment_params
        params.require(:appointment).permit(:job_name, :job_description, :appointment_time, :client_id, :contractor_id)
    end
end
