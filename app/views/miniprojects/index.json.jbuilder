json.array!(@miniprojects) do |miniproject|
  json.extract! miniproject, :id, :name, :github, :course_id
  json.url miniproject_url(miniproject, format: :json)
end
