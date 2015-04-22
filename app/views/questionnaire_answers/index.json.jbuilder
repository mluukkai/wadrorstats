json.array!(@questionnaire_answers) do |questionnaire_answer|
  json.extract! questionnaire_answer, :id, :name, :identifier
  json.url questionnaire_answer_url(questionnaire_answer, format: :json)
end
