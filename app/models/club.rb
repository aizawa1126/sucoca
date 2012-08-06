class Club < ActiveRecord::Base
  has_many :courses, :dependent => :destroy

  attr_accessible :address, :name
end
