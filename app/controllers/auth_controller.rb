class AuthController < ApplicationController


    def create
        user = User.find_by(username: login_params[:username])

        if user && user.authenticate(login_params[:password])
            token = encode_token({ user_id: user.id })
            render json: { user: user, jwt: token }, status: :accepted
        else 
            render json: {message: "Incorrect username/password"}
        end 
    end



private

    def login_params
        params.require(:auth).permit(:username, :password)
    end 
end


