class Poll < ActiveRecord::Base
  attr_accessible :name
  
  validates :name, :uniqueness => true, :length => { :minimum => 3 }
end
