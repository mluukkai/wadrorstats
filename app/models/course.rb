class Course < ActiveRecord::Base
  has_many :submissions
  has_many :week_statistics

  def self.current
    Course.last
  end

  def take_into_account_in_stats(submission)
    week_stats = week_statistics.find_by(week:submission.week)
    week_stats.take_into_account(submission)
    week_stats.save
  end

  def update_stats_with(new_submission, old_submission)
    week_stats = week_statistics.find_by(week:new_submission.week)
    week_stats.update_with(new_submission, old_submission)
    week_stats.save
  end

  def to_s
    "#{name} #{term}"
  end

  def exercises_at_week(week)
    method = "week#{week}".to_s
    self.send(method)
  end

  def exercises_max
    (1..6).map{ |w| exercises_at_week(w) }.sort.last
  end
end
