json.array!(@feedbacks) do |feedback|
  json.extract! feedback, :id, :content, :course_id
  json.url feedback_url(feedback, format: :json)
end
