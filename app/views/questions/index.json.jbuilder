json.array!(@questions) do |question|
  json.extract! question, :id, :type, :questionnaire_id, :description
  json.url question_url(question, format: :json)
end
