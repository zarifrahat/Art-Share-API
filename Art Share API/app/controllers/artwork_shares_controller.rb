class ArtworkSharesController < ApplicationController

    # .where("viewer_id = ?", params[:viewer_id])
    # def index 
    #     if params[:viewer_id] 
    #         @shares = ArtworkShare.where(viewer_id: params[:viewer_id])
    #     else
    #         @shares = ArtworkShare.all
    #     end
    #     render json: @shares
    # end

    # def show
    #     @share = ArtworkShare.find(params[:id])
    #     render json: @share
    # end

    def create
        @share = ArtworkShare.new(artwork_params)
        if @share.save
            render json: @share
        else
            render json: @share.errors.full_messages, status: 422
        end
    end

    def destroy
        @share = ArtworkShare.find(params[:id])
        @share.destroy
        render json: @share
        # redirect_to artwork_share_url
    end

    private
    def artwork_params
        params.require(:shares).permit(:artwork_id, :viewer_id)
    end
end