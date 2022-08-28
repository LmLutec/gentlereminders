class UsersController < ApplicationController
    def index
        @users = User.all 
        render json: @users 
    end 

    def show
        @user = User.find(params[:id])
        render json: @user
    end 

    def create
        @user = User.create(
            username: params[:username],
            password: params[:password],
            role: params[:role]
        )

        if @user.valid? 
            token = encode_token(user_id: @user.id)
            render json: { user: @user, jwt: token}, status: :created 
        else 
            render json: {message: @user.errors.messages} 
        end 

       
    end 

    def update
        @user = User.find(params[:id])
        @user.update(
            username: params[:username],
            password: params[:password],
            # favs: params[:favs],
            # hidden: params[:hidden],
            # read: params[:read]
        )
        render json: @user
    end 

    def destroy
        @users = User.all 
        @user = User.find(params[:id])
        @user.destroy
        render json: @user
    end 
end
