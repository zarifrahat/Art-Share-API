class ArtworksController < ApplicationController

    def index
        # debugger
        @artworks = User.find(params[:user_id]).artworks
        @shared_artworks = User.find(params[:user_id]).shared_artworks
        render json: @artworks + @shared_artworks
    end

    def add_favorite
        @favorite = Artwork.find(params[:id]).update(own_favorites: true)

    end

    def create
        @new_artwork = Artwork.new(artwork_params)
        if @new_artwork.save
            render json: @new_artwork
        else
            render json: @new_artwork.errors.full_messages, status: 422
        end
    end
    
    def show
        @artwork = Artwork.find(params[:id])
        render json: @artwork
    end
    
    def update
        @artwork = Artwork.find(params[:id])
        if @artwork.update(artwork_params)
            redirect_to artwork_url
        else
            render json: @artwork.errors.full_messages, status: 422
        end
    end
    
    def destroy
        @artwork = Artwork.find(params[:id])
        @artwork.destroy
        redirect_to artworks_url
    end
    
    private
    def artwork_params
        params.require(:artwork).permit(:title, :img_url, :artist_id)
    end
end



