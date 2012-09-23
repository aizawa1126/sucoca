class User < ActiveRecord::Base
  attr_accessible :account, :password, :password_confirmation, :name

  validates :account, :presence => {:message =>'already exits'}, :uniqueness => true
  validates :password, :confirmation => true

  def self.authenticate(attributes)
    find_by_account_and_password(attributes[:account], attributes[:password])
  end
end
