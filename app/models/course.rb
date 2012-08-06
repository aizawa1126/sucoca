class Course < ActiveRecord::Base
  belongs_to :club
  has_many :holes, :dependent => :destroy

  attr_accessible :club_id, :name
end
