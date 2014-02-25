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

  private

  def init
    self.total ||= 0
    self.weeks = []
  end
end
