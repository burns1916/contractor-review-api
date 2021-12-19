class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :job_name, :job_description, :appointment_time, :reviews
end
