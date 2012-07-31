class Question < ActiveRecord::Base
    attr_accessible :poll_id, :question
  
    has_many :answers, :dependent => :destroy
    belongs_to :poll
    
    validates_presence_of :question
end
