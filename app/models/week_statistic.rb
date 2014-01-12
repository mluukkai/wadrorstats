class WeekStatistic < ActiveRecord::Base
  belongs_to :course

  serialize :exercises
  serialize :times


  def average_time
    used_time/submissions
  end

  def average_exercises
    completed_exercises/submissions
  end
end
