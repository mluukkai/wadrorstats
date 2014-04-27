class VersionControl < ActiveRecord::Base
  belongs_to :course
  belongs_to :student

  validates_presence_of :first_name
  validates_presence_of :last_name

  validates :student_number,
            :format => { :with => /\A0\d{8}\z/,
                         :message => "should start with 0 and be followed by 8 digits" }
end
