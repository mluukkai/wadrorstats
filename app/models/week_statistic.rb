class WeekStatistic < ActiveRecord::Base
  after_initialize :init
  belongs_to :course

  serialize :exercises
  serialize :times

  def take_into_account(new_submission)
    self.submissions += 1
    self.completed_exercises += new_submission.total
    self.used_time += new_submission.hours

    increase_counts_with new_submission
  end

  def update_with(new_submission, old_submission)
    self.completed_exercises += new_submission.total-old_submission.total
    self.used_time += new_submission.hours-old_submission.hours

    increase_counts_with new_submission
    decrease_counts_with old_submission
  end

  def decrease_counts_with(old_submission)
    old_times_count = times[old_submission.hours] || 0
    self.times[old_submission.hours] = old_times_count>1 ? old_times_count-1 : nil

    old_exercise_count = exercises[old_submission.total]
    self.exercises[old_submission.total] = old_exercise_count>1 ? old_exercise_count-1 : nil
  end

  def increase_counts_with(new_submission)
    times_count = times[new_submission.hours] || 0
    self.times[new_submission.hours] = times_count + 1

    exercises_count = exercises[new_submission.total] || 0
    self.exercises[new_submission.total] = exercises_count + 1
  end

  def average_time
    1.0*used_time/submissions
  end

  def average_exercises
    1.0*completed_exercises/submissions
  end

  private

    def init
      self.times ||= []
      self.exercises ||= []
      self.submissions ||= 0
      self.completed_exercises ||= 0
      self.used_time ||= 0
    end
end
