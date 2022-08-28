class ApplicationController < ActionController::API


        def encode_token(payload)
            # exp = Time.now.to_i + 60 * 60
            # payload[:exp] = exp
    # byebug
            secret = 'test1234'
    
            JWT.encode(payload.merge(exp: 15.minutes.from_now.to_i), secret)
    
        end 
    
        def auth_header
            request.headers['Authorization']
        end 
    
        def decoded_token
            if auth_header
        # byebug
                token = auth_header.split(' ')[1]
                begin
                    decoded_token = JWT.decode(token, 'test1234', true, algorithm: 'HS256')
                rescue JWT::DecodeError
                   nil
                rescue JWT::ExpiredSignature
                    nil 
                end 
             
            end 
        end
    
        def current_user
            if decoded_token
                user_id = decoded_token[0]['user_id']
                user = User.find(user_id)
            end 
        end 
    
        def logged_in?
            !!current_user
        end 
    
        def authorized
            render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
        end
    
    
end
