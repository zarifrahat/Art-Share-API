# == Schema Information
#
# Table name: artworks
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  img_url    :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    validates :title, :img_url, :artist_id, presence: true
    validates :artist_id, uniqueness: { scope: :title }

    belongs_to :artist,
    class_name: :User,
    foreign_key: :artist_id

    has_many :shares,
    class_name: :ArtworkShare,
    foreign_key: :artwork_id,
    dependent: :destroy

    has_many :likes, as: :likeable

    has_many :comments,
        class_name: :Comment,
        foreign_key: :artwork_id,
        dependent: :destroy

    has_many :shared_viewers,
    through: :shares,
    source: :viewer

    has_many :commenters,
        through: :comments,
        source: :commenter

    has_many :likers,
        through: :likes,
        source: :liker
end

