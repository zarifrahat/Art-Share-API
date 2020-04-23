# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  body         :text             not null
#  artwork_id   :integer          not null
#  commenter_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Comment < ApplicationRecord
    validates :body, presence: true

    belongs_to :commenter,
        class_name: :User,
        foreign_key: :commenter_id

    belongs_to :artwork,
        class_name: :Artwork,
        foreign_key: :artwork_id

    has_many :likes, as: :likeable

    has_many :likers,
        through: :likes,
        source: :liker
end
