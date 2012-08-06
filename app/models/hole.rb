class Hole < ActiveRecord::Base
  belongs_to :course

  attr_accessible :course_id, :hdcp, :number, :par, :yard
  
  default_scope :order => 'number'
end
