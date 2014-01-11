require 'digest/sha1'

class Submission < ActiveRecord::Base
  belongs_to :course

  def generate_digest
    self.identifier = Digest::SHA1.hexdigest "#{email}#{created_at}"
  end

  def assignment(n)
    self.send("a#{n}".to_sym)
  end

  def exercises_at_this_week
    self.course.exercises_at_week(week)
  end

  def total
    (1..21).inject(0) do |sum, i|
      sum += assignment(i) ? 1 : 0;
    end
  end
end
