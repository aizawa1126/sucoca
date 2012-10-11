class Party < ActiveRecord::Base
  belongs_to :user
  belongs_to :scorecard

  attr_accessible :scorecard_id, :user_id
end
