class PollsController < ApplicationController
    def index
        @polls = Poll.all
    end
    
    def show
        @poll = Poll.find_by_id(params[:id])
    end
    
    def new
        @poll = Poll.new
    end

    def create
        @poll = Poll.new(params[:poll])
        if @poll.save
            flash[:success] = "Poll created."
            redirect_to poll_path(@poll)
        else
            flash.now[:error] = "Poll not created."
            render 'new' 
        end
    end

    def edit
        @poll = Poll.find_by_id(params[:id])
    end

    def update

    end
end
