json.array!(@courses) do |course|
  json.extract! course, :id, :name, :term, :week1, :week2, :week3, :week4, :week5, :week6
  json.url course_url(course, format: :json)
end
