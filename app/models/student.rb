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

  def challenging_at_week(w)
    s = submissions.where(week:w).first
    return 1 if s and s.challenging?
    ""
  end

  def total
    (1..7).inject(0){ |sum, n| sum+total_at_week(n) }
  end

  def vc_all
    vc_sum = vc(1) + vc(2) + vc(3) + vc(4) + vc(5) + vc(6) + vc(7)
    return "1" if vc_sum == 7
    ""
  end

  def non_vc_total
    non_vc(1) + non_vc(2) + non_vc(3) + non_vc(4) + non_vc(5) + non_vc(6) + non_vc(7)
  end

  def non_vc(week)
    sub = submissions.find_by(week:week)

    vcs = {
      1 => [1,2,3,4,11],
      2 => [4,5,6,7],
      3 => [],
      4 => [4,5,6],
      5 => [6,7,8],
      6 => [5,7],
      7 => []
    }

    return 0 if sub.nil?

    vc_total = vcs[week].inject(0) do |sum, vc|
      sum + (sub.a(vc) ? 1 : 0 )
    end

    sub.total - vc_total
  end

  def vc(week)
    sub = submissions.find_by(week:week)

    vcs = {
      1 => [2,3,4,4,12],
      2 => [4,5,6,7],
      3 => [],
      4 => [4],
      5 => [6,7,8],
      6 => [5,6,7],
      7 => []
    }

    return 0 if sub.nil? and vcs[week].any?

    vcs[week].each do |vc|
      return 0 unless sub.a(vc)
    end

    1
  end

  private

  def init
    self.total ||= 0
    self.weeks = []
  end
end
