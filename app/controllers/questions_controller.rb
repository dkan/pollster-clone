class QuestionsController < ApplicationController
    before_filter :find_question, :only => [:edit, :update, :destroy]
    
    def create 
        @question = Question.new(params[:question])
        if @question.save
            flash[:success] = "Question Added"
            redirect_to :back
        else
            flash[:error] = "Need a question" 
            redirect_to root_path
        end
    end
    
    def edit
    end
    
    def update
        if @question.update_attributes(params[:question])
            flash[:success] = 'Question Updated'
            redirect_to edit_poll_path(Poll.find_by_id(@question.poll_id).edit_link)
        else
            flash[:error] = "Invalid Edit"
            redirect_to edit_question_path(@question)
        end
    end
    
    def destroy
        @question.destroy
        flash[:success] = "Question removed"
        redirect_to :back
    end
    
    private
    
    def find_question
        @question = Question.find_by_id(params[:id])
    end
end
