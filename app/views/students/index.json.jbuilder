json.array!(@students) do |student|
  json.extract! student, :id, :student_number, :last_name, :first_name, :total, :weeks
  json.url student_url(student, format: :json)
end
