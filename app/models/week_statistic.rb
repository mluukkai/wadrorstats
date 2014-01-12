class WeekStatistic < ActiveRecord::Base
  belongs_to :course

  serialize :exercises
  serialize :times


  def average_time
    1.0*used_time/submissions
  end

  def average_exercises
    1.0*completed_exercises/submissions
  end
end
