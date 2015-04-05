json.array!(@questionnaires) do |questionnaire|
  json.extract! questionnaire, :id, :name
  json.url questionnaire_url(questionnaire, format: :json)
end
