class Project < ActiveRecord::Base
  belongs_to :course
  belongs_to :student

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email

  validates :github,
            :format => { :with => /https:\/\/github.com\/.+\/.+/,
                         :message => "copy/paste your repo address here from browser address line" }

  validates :student_number,
            :format => { :with => /\A0\d{8}\z/,
                         :message => "should start with 0 and be followed by 8 digits" }
end
