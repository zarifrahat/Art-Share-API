# == Schema Information
#
# Table name: users
#
#  id       :integer          not null, primary key
#  username :string           not null
#
class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true

    has_many :artworks,
    class_name: :Artwork,
    foreign_key: :artist_id,
    dependent: :destroy

    has_many :shares,
    class_name: :ArtworkShare,
    foreign_key: :viewer_id,
    dependent: :destroy

    has_many :comments,
        class_name: :Comment,
        dependent: :destroy,
        foreign_key: :commenter_id

    has_many :likes,
        class_name: :Like,
        foreign_key: :liker_id

    has_many :shared_artworks,
    through: :shares,
    source: :artwork

    has_many :commented_artworks,
        through: :comments,
        source: :artwork

    has_many :comments_on_my_art,
        through: :artworks,
        source: :comments
    
    has_many :commenters_on_my_art,
        through: :artworks,
        source: :commenters

    has_many :liked_comments,
        through: :likes,
        source: :likeable,
        source_type: "Comment"

    has_many :liked_artworks,
        through: :likes,
        source: :likeable,
        source_type: "Artwork"
end
