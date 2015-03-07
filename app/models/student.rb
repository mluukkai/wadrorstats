class Student < ActiveRecord::Base
  before_create :init

  serialize :weeks

  has_many :submissions

  def self.generate
    numbers = Submission.all.map(&:student_number).uniq
    numbers.each do |number|
      sub = Submission.where(student_number:number).first
      Student.create student_number:sub.student_number, first_name:sub.first_name, last_name:sub.last_name
    end
  end

  def total_at_week(w)
    s = submissions.where(week:w).first
    return 0 if s.nil?
    s.total
  end

  def total
    (1..7).inject(0){ |sum, n| sum+total_at_week(n) }
  end

  private

  def init
    self.total ||= 0
    self.weeks = []
  end
end
