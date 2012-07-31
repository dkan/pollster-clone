class ResponsesController < ApplicationController
    def new
        @response = Response.new(:poll_id => params[:id])
        @poll = Poll.find_by_id(params[:id])
        @poll.questions.each do |q|
            @response.answers.new(:question_id => q.id)
        end
    end
    
    def create
        @response = Response.new(:poll_id => params[:response][:poll_id])
        @response.create_answers(params[:response][:answers_attributes].values)

        if @response.save
            flash[:success] = "Survey submitted"
            redirect_to root_path
        else
            flash[:error] = "Survey not submitted"
            redirect_to :back
        end
    end
end
