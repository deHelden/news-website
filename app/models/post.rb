# == Schema Information
#
# Table name: posts
#
#  id             :bigint(8)        not null, primary key
#  title          :string           not null
#  content        :string           not null
#  description    :string           not null
#  visibility     :text
#  published_date :datetime
#  status         :string           not null
#  importance     :boolean
#  rating         :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  category_id    :bigint(8)
#

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
end
