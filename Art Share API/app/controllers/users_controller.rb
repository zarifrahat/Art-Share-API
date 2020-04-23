class UsersController < ApplicationController

    def index
        if params[:name] 
            @users = User.where("username LIKE ?", "%#{params[:name]}%")
        else 
            @users = User.all
        end
        render json: @users
    end
    
    #http://localhost:3000/users/?name=cnulty
#   /users/
#     {
#     "comment": {
#         "artwork_id": "20",
#         "commenter_id": "3",
#         "body": "Don't quit your day job."
#     },
#     "controller": "users",
#     "action": "index"
# }

# /users/?name=mmcnulty
# {
#     "comment": {
#         "artwork_id": "20",
#         "commenter_id": "3",
#         "body": "Don't quit your day job."
#     },
#     "name": "mmcnulty",
#     "controller": "users",
#     "action": "index"
# }

    def create
        # render json: params
        user = User.new(user_params)
        if user.save 
            render json: user
        else
            render json: user.errors.full_messages, status: 422
        end
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_url(@user.id)
        else
            render json: @user.errors.full_messages, status: 422
        end
    end
    
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_url
    end

    private
    def user_params
        params.require(:user).permit(:username)
    end
end