# == Schema Information
#
# Table name: likes
#
#  id            :integer          not null, primary key
#  liker_id      :integer          not null
#  likeable_type :string
#  likeable_id   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Like < ApplicationRecord
    belongs_to :liker,
        class_name: :User,
        foreign_key: :liker_id

    belongs_to :likeable,
        polymorphic: true

end
