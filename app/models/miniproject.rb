class Miniproject < ActiveRecord::Base
	has_many :participants

	validates_presence_of :name
	validates_uniqueness_of :name

  	validates :github,
            :format => { :with => /\A\z|https:\/\/github.com\/.+\/.+/,
                         :message => "copy/paste your repo address here from browser address line" }

    attr_accessor :email

	def generate_digest
    	self.identifier = Digest::SHA1.hexdigest "#{name}#{Time.now}"
	end
end