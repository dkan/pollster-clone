class AnswersController < ApplicationController
    def create
        @answer = Answer.new(params[:answer])
        if @answer.save
            flash[:success] = 'answer success'
        else
            flash[:error] = 'answer error'
        end
        redirect_to root_path
        
    end
end
