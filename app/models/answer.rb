class Answer < ActiveRecord::Base
  attr_accessible :body, :question_id, :response_id
  
  belongs_to :response
  belongs_to :question
  
  validates_presence_of :body
end
