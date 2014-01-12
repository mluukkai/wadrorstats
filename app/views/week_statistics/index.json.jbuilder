json.array!(@week_statistics) do |week_statistic|
  json.extract! week_statistic, :id, :week, :course_id, :submissions, :completed_exercises, :used_time, :exercises, :times
  json.url week_statistic_url(week_statistic, format: :json)
end
