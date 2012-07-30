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
            flash[:success] = "Link to edit: #{request.host}:#{request.port}/#{@poll.edit_link}"
            redirect_to poll_path(@poll)
        else
            flash.now[:error] = "Poll not created."
            render 'new' 
        end
    end

    def edit
        @poll = Poll.find_by_edit_link(params[:edit_link])
    end

    def update
        @poll = Poll.find_by_edit_link(params[:poll][:edit_link])
        if @poll.update_attributes(params[:poll])
            flash[:success] = 'Poll Updated'
            redirect_to poll_path(@poll)
        else
            flash[:error] = "Invalid Edit"
            redirect_to edit_poll_path(@poll)
        end
    end
end
