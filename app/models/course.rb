class Course < ActiveRecord::Base
  after_initialize :init
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

  private

    def init
      self.week1 ||= 1
      self.week2 ||= 2
      self.week3 ||= 3
      self.week4 ||= 4
      self.week5 ||= 5
      self.week6 ||= 6
      self.current_week ||= 1
    end
end
