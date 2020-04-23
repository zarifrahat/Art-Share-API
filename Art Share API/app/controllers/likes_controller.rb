class LikesController < ApplicationController

    def index
        if like_params[:artwork]
            @likes = Artwork.find(like_params[:artwork]).likers
        elsif like_params[:comment]
            @likes = Comment.find(like_params[:comment]).likers
        elsif like_params[:user]
            @user = User.find(like_params[:user])
            @likes = @user.liked_artworks + @user.liked_comments
        end
        render json: @likes
    end

    def destroy
        @like = Like.find(params[:id])
        @like.destroy
        render json: @like.likeable
    end

    def create
        if params[:artwork_id]
            @like = Artwork.find(params[:artwork_id]).likes.new(liker_id: like_params[:user])
        elsif params[:comment_id]   
            @like = Comment.find(params[:comment_id]).likes.new(liker_id: like_params[:user])
        end

        if @like.save
            render json: @like.likeable
        else
            render json: @like.errors.full_messages, status: 422
        end
    end
    private
    def like_params
        params.require(:likes).permit(:user, :artwork, :comment)
    end

end

# v from params, either artwork_id or comment_id
# artwork1.likes.new(liker_id: [liker_idwhatever it is])

# post /artworks/3/likes
# post /comments/12/likes

# check if there is an artwork or comment id (doesn't work without one or the other)
# if it's an artwork, get to that artwork and run above
# comment, likewise but on the comment instead?
# render at the end

# shares[artwork_id]:18
# likes[liker_id]:[somenumber]

# post /artworks/18/likes
#     {
#     "likes": {
#         "liker_id": "2",
#     },
#     artwork_id: 18
#     "controller": "users",
#     "action": "index"
# }