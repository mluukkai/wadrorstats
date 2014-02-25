require 'digest/sha1'

class Submission < ActiveRecord::Base
  belongs_to :course
  belongs_to :student

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email

  validates_numericality_of :hours, { :greater_than_or_equal_to => 1,
                                      :less_than_or_equal_to => 50,
                                      :only_integer => true }

  validates :github,
            :format => { :with => /https:\/\/github.com\/.+\/.+/,
                         :message => "copy/paste your repo address here from browser address line" }

  validates :student_number,
            :format => { :with => /\A0\d{8}\z/,
                         :message => "should start with 0 and be followed by 8 digits" }

  def self.attach_to_students
    Submission.all.each do |sub|
      student = Student.find_by student_number:sub.student_number
      student.submissions << sub unless sub.student
    end
  end

  def self.new_with_digest(params)
    submission = Submission.new(params)
    submission.generate_digest
    submission.course = Course.current
    submission
  end

  def prefill_fields_if_in_development
    return unless Rails.env.development?

    self.student_number = "012345678"
    self.first_name = "Matti"
    self.last_name = "Luukkainen"
    self.email = "mluukkai@iki.fi"
  end

  def generate_digest
    self.identifier = Digest::SHA1.hexdigest "#{email}#{Time.now}"
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
