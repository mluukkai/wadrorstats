json.array!(@submissions) do |submission|
  json.extract! submission, :id, :student_number, :last_name, :first_name, :week, :points, :identifier, :hours, :comments, :email, :a1
  json.url submission_url(submission, format: :json)
end
