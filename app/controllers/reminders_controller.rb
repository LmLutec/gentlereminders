class RemindersController < ApplicationController
    def index
        @reminders = Reminder.all 
        render json: @reminders 
    end 

    def show
        @reminder = Reminder.find(params[:id])
        render json: @reminder
    end 

    def create
        @reminder = Reminder.create(
            message: params[:message],
            author: params[:author],
        )
        render json: @reminder
    end 

    def update
        @reminder = Reminder.find(params[:id])
        @reminder.update(
            message: params[:message],
            author: params[:author],
        )
        render json: @reminder
    end 

    def destroy
        @sreminders = Reminder.all 
        @reminder = Reminder.find(params[:id])
        @reminder.destroy
        render json: @reminder
    end 

end
