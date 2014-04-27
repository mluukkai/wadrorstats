json.array!(@version_controls) do |version_control|
  json.extract! version_control, :id, :student_number, :last_name, :first_name, :email, :course_id, :student_id, :done
  json.url version_control_url(version_control, format: :json)
end
