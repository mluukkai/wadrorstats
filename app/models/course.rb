class Course < ActiveRecord::Base
  has_many :submissions
  has_many :week_statistics

  def self.current
    Course.last
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
