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

  def vc_all
    vc_sum = vc(1)+vc(2)+vc(3)+vc(4)+vc(5)+vc(6)+vc(7)
    vc_sum == 7
  end

  def vc(week)
    sub = submissions.find_by(week:week)

    vcs = {
      1 => [1,2,3,4,11],
      2 => [4,5,6,7],
      3 => [],
      4 => [4,5,6],
      5 => [4,5,6,7,8],
      6 => [],
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
