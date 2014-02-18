json.array!(@submissions) do |submission|
  json.extract! submission, :id, :student_number, :last_name, :first_name, :week, :points, :identifier, :hours, :comments, :email, :total, :exercises_at_this_week, :course_id
  json.url submission_url(submission, format: :json)
end
