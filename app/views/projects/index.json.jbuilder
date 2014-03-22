json.array!(@projects) do |project|
  json.extract! project, :id, :student_number, :last_name, :first_name, :email, :course_id, :student_id, :github
  json.url project_url(project, format: :json)
end
