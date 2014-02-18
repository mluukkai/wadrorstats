json.array!(@submissions) do |submission|
  json.extract! submission, :id, :student_number, :week, :hours, :total, :exercises_at_this_week, :course_id
end
