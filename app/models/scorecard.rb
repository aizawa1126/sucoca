class Scorecard < ActiveRecord::Base
  has_many :parties, :dependent => :destroy

  attr_accessible :course_id, :date
end
