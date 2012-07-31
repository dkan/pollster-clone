class Response < ActiveRecord::Base
    attr_accessible :poll_id
  
    has_many :answers, :dependent => :destroy
    belongs_to :poll
  
    accepts_nested_attributes_for :answers

    def create_answers(answers)
        answers.each do |answer|
            Answer.create(answer)  
        end
    end
  
end

