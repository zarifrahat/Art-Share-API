class CommentsController < ApplicationController
    
    def index
        if params[:user_id]
            @comments = Comment.all.where('commenter_id = ?', params[:user_id])
        elsif params[:artwork_id]
            @comments = Comment.all.where('artwork_id = ?', params[:artwork_id])  
        end
        render json: @comments
    end

    def create
        @comment = Comment.new(comment_params)
        if @comment.save
            render json: @comment
        else
            render json: @comment.errors.full_messages, status: 422
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        render json: @comment
    end

    private 
        def comment_params
            params.require(:comment).permit(:artwork_id, :commenter_id, :body)
        end

end

# /artworks/:id/comments
# /users/:id/comments

# /comments/
