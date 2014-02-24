json.array!(@submissions) do |submission|
  json.extract! submission, :id, :student_number, :week, :points, :identifier, :hours, :comments, :email, :total, :course_id
  json.url submission_url(submission, format: :json)
end
