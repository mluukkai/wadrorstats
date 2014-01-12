class WeekStatistic < ActiveRecord::Base
  belongs_to :course

  serialize :exercises
  serialize :times

end
